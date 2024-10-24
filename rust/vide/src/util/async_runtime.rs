//! 异步运行时

use std::{
  future::Future,
  sync::{Mutex, OnceLock},
  thread::{self, JoinHandle},
  time::Duration,
};

use nvim_oxi::{libuv::AsyncHandle, schedule};
use tokio::{
  runtime::Runtime,
  sync::mpsc::{self, UnboundedSender},
  time::Sleep,
};

static RUNTIME: OnceLock<Runtime> = OnceLock::new();
static HANDLER: OnceLock<Mutex<AsyncHandler>> = OnceLock::new();

/// 初始化异步运行时
///
/// # Panics
///
/// - 初始化 `tokio` 运行时失败
/// - 初始化 `AsyncHandle` 失败 (libuv)
pub fn init() {
  let runtime = tokio::runtime::Builder::new_multi_thread()
    .enable_all()
    .build()
    .expect("creates the configured async runtime");
  RUNTIME.set(runtime).expect("init async runtime");

  if HANDLER.set(Mutex::new(AsyncHandler::new())).is_err() {
    panic!("AsyncHandler init failed");
  }
}

/// 异步任务暂停 `millis` 毫秒
#[inline(always)]
pub fn sleep(millis: u64) -> Sleep {
  tokio::time::sleep(Duration::from_millis(millis))
}

/// 创建一个新的线程，并执行异步任务
pub fn spawn<F>(future: F) -> JoinHandle<<F as Future>::Output>
where
  F: Future + Send + 'static,
  F::Output: Send + 'static,
{
  thread::spawn(|| {
    let runtime = RUNTIME.get().expect("get async runtime");
    runtime.block_on(future)
  })
}

/// 将 `callback` 函数发送到主线中去执行
pub fn sync(callback: impl Fn() + Send + 'static) {
  send(AsyncMessage::Sync(Box::new(callback)));
}

/// 向异步任务处理器中发送消息
fn send(message: AsyncMessage) {
  let handler_mutex = HANDLER.get().expect("get AsyncHandler");
  let handler = handler_mutex.lock().expect("lock AsyncHandler");
  handler.send(message);
}

/// 异步任务通知消息
enum AsyncMessage {
  Sync(Box<dyn Fn() + Send>),
}

/// 异步任务处理器
struct AsyncHandler {
  sender: UnboundedSender<AsyncMessage>,
  handle: AsyncHandle,
}

impl AsyncHandler {
  fn new() -> Self {
    let (sender, mut receiver) = mpsc::unbounded_channel::<AsyncMessage>();

    let handle = AsyncHandle::new(move || {
      let Some(message) = receiver.blocking_recv() else {
        return;
      };
      match message {
        AsyncMessage::Sync(callback) => schedule(move |_| callback()),
      }
    })
    .expect("registers a new callback on the Neovim event loop");

    Self { sender, handle }
  }

  fn send(&self, message: AsyncMessage) {
    self.sender.send(message).expect("send an AsyncMessage");
    self.handle.send().expect("wakes up the Neovim event loop");
  }
}
