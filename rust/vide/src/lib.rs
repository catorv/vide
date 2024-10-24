use nvim_oxi::{api, Dictionary, Function};
use util::async_runtime;

mod client;
mod dev;
mod marcos;
mod types;
mod ui;
mod util;

fn vide() -> Dictionary {
  async_runtime::init();

  let init = Function::from_fn(|()| {
    #[cfg(debug_assertions)]
    dev::run();

    api::set_var("vide", env!("CARGO_PKG_VERSION").to_owned()).unwrap();
  });

  dict!(
    init   => init,
    client => client::exports(),
    cursor => ui::cursor::exports(),
  )
}

// see: https://doc.rust-lang.org/beta/rustc/platform-support.html

#[cfg(all(target_os = "macos", target_arch = "aarch64"))]
#[nvim_oxi::plugin]
fn vide_aarch64_apple_darwin() -> Dictionary {
  vide()
}

#[cfg(all(target_os = "macos", target_arch = "x86_64"))]
#[nvim_oxi::plugin]
fn vide_x86_64_apple_darwin() -> Dictionary {
  vide()
}

#[cfg(all(target_os = "linux", target_arch = "aarch64"))]
#[nvim_oxi::plugin]
fn vide_aarch64_unknown_linux_gnu() -> Dictionary {
  vide()
}

#[cfg(all(target_os = "linux", target_arch = "x86_64"))]
#[nvim_oxi::plugin]
fn vide_x86_64_unknown_linux_gnu() -> Dictionary {
  vide()
}

#[cfg(all(target_os = "linux", target_arch = "x86"))]
#[nvim_oxi::plugin]
fn vide_i686_unknown_linux_gnu() -> Dictionary {
  vide()
}

#[cfg(all(target_os = "windows", target_arch = "aarch64"))]
#[nvim_oxi::plugin]
fn vide_aarch64_pc_windows_msvc() -> Dictionary {
  vide()
}

#[cfg(all(target_os = "windows", target_arch = "x86_64"))]
#[nvim_oxi::plugin]
fn vide_x86_64_pc_windows_msvc() -> Dictionary {
  vide()
}

#[cfg(all(target_os = "windows", target_arch = "x86"))]
#[nvim_oxi::plugin]
fn vide_i686_pc_windows_msvc() -> Dictionary {
  vide()
}
