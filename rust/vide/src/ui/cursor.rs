use std::sync::{LazyLock, Mutex};

use nvim_oxi::api;

use crate::{export, func, option};

export!(
  hide => func!(hide),
  show => func!(show),
);

const CURSOR_HIDDEN: &str = "a:VideCursorHidden";

static CURSOR_LAST: LazyLock<Mutex<String>> = LazyLock::new(|| {
  api::command("hi VideCursorHidden blend=100 gui=reverse").unwrap();
  Mutex::new("".to_owned())
});

/// 隐藏光标
pub fn hide() {
  if !option!("termguicolors", false) {
    return;
  }
  let guicursor: String = option!("guicursor");
  if !guicursor.is_empty() {
    let mut last = CURSOR_LAST.lock().unwrap();
    *last = guicursor;
    api::set_option("guicursor", CURSOR_HIDDEN).unwrap();
  }
}

/// 显示光标
pub fn show() {
  if !option!("termguicolors", false) {
    return;
  }
  let guicursor: String = option!("guicursor");
  if guicursor == CURSOR_HIDDEN {
    let last = CURSOR_LAST.lock().unwrap();
    api::set_option("guicursor", last.to_owned()).unwrap();
  }
}
