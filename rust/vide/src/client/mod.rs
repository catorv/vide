//! 客户端(全局)范围的功能模块
use crate::{export, func};

mod option;
mod size;

export!(
  columns => func!(size::columns),
  lines   => func!(size::lines),
  size    => func!(size::size),
);
