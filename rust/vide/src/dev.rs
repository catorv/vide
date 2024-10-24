use nvim_oxi::print;

use crate::util::async_runtime::{self, sleep, sync};

pub fn run() {
  async_runtime::spawn(async {
    for i in 0..3 {
      sleep(1000).await;
      sync(move || {
        print!("i = {}", i);
      });
    }
  });
}
