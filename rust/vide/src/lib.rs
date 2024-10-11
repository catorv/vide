use nvim_oxi::{api, Dictionary, Function, Object};

fn vide() -> Dictionary {
  // let version = Function::from_fn(|()| env!("CARGO_PKG_VERSION").to_owned());

  let init = Function::from_fn(|()| {
    api::set_var("vide", env!("CARGO_PKG_VERSION").to_owned()).unwrap();
  });

  Dictionary::from_iter([
    // ("version", Object::from(version)),
    ("init", Object::from(init)),
  ])
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
