/// Get the value of an option
#[macro_export]
macro_rules! option {
  ($name:expr) => {
    $crate::option!($name, Default::default(), &Default::default())
  };
  ($name:expr, $default:expr) => {
    $crate::option!($name, $default, &Default::default())
  };
  ($name:expr, $default:expr, $opts:expr) => {
    nvim_oxi::api::get_option_value($name, $opts).unwrap_or($default)
  };
}
