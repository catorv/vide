/// 导出到Lua中的对象([`nvim_oxi::Dictionary`](1))
///
/// 1: [`nvim_oxi::Dictionary`]
#[macro_export]
macro_rules! export {
  ($( $name:ident => $value:expr ),* $(,)?) => {
    pub fn exports() -> nvim_oxi::Dictionary {
      $crate::dict!(
        $( $name => $value ),*
      )
    }
  };
}

/// 根据键值对生成[`nvim_oxi::Dictionary`](1)对象
///
/// 1: [`nvim_oxi::Dictionary`]
#[macro_export]
macro_rules! dict {
  ($( $name:ident => $value:expr ),* $(,)?) => {
    nvim_oxi::Dictionary::from_iter([
      $(
        (stringify!($name), nvim_oxi::Object::from($value))
      ),*
    ])
  };
}

/// 生成[`nvim_oxi::Function`](1)对象
///
/// 1: [`nvim_oxi::Function`]
#[macro_export]
macro_rules! func {
  ($name:path) => {
    nvim_oxi::Function::from_fn(|()| $name())
  };
}

/// 使Rust类型兼容Lua类型
#[macro_export]
macro_rules! lua_typedef {
  ($type:ty) => {
    impl nvim_oxi::conversion::FromObject for $type {
      fn from_object(obj: nvim_oxi::Object) -> Result<Self, nvim_oxi::conversion::Error> {
        Self::deserialize(nvim_oxi::serde::Deserializer::new(obj)).map_err(Into::into)
      }
    }

    impl nvim_oxi::conversion::ToObject for $type {
      fn to_object(self) -> Result<nvim_oxi::Object, nvim_oxi::conversion::Error> {
        self
          .serialize(nvim_oxi::serde::Serializer::new())
          .map_err(Into::into)
      }
    }

    impl nvim_oxi::lua::Poppable for $type {
      unsafe fn pop(
        lua_state: *mut nvim_oxi::lua::ffi::lua_State,
      ) -> Result<Self, nvim_oxi::lua::Error> {
        let obj = nvim_oxi::Object::pop(lua_state)?;
        <Self as nvim_oxi::conversion::FromObject>::from_object(obj)
          .map_err(nvim_oxi::lua::Error::pop_error_from_err::<Self, _>)
      }
    }

    impl nvim_oxi::lua::Pushable for $type {
      unsafe fn push(
        self,
        lua_state: *mut nvim_oxi::lua::ffi::lua_State,
      ) -> Result<std::ffi::c_int, nvim_oxi::lua::Error> {
        <Self as nvim_oxi::conversion::ToObject>::to_object(self)
          .map_err(nvim_oxi::lua::Error::push_error_from_err::<Self, _>)?
          .push(lua_state)
      }
    }
  };
}
