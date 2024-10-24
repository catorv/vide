use crate::{option, types::ui::Size};

/// 获取客户端总字符宽度
#[inline]
pub fn columns() -> isize {
  option!("columns", 0)
}

/// 获取客户端总字符高度
#[inline]
pub fn lines() -> isize {
  option!("lines", 0)
}

/// 获取客户端大小（字符）
#[inline]
pub fn size() -> Size {
  Size {
    columns: columns(),
    lines: lines(),
  }
}

#[cfg(debug_assertions)]
mod tests {
  use super::*;

  #[nvim_oxi::test]
  fn test_client_get_size() {
    let Size { columns, lines } = size();
    println!("client size: {}x{}", columns, lines);

    assert_eq!(columns, 80);
    assert_eq!(lines, 24);
  }
}
