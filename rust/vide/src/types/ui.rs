use serde::{Deserialize, Serialize};

use crate::lua_typedef;

#[derive(Serialize, Deserialize)]
pub struct Size {
  pub columns: isize,
  pub lines: isize,
}
lua_typedef!(Size);
