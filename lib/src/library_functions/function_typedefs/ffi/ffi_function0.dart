import 'dart:ffi' as ffi;

typedef FFIFunction0<R extends ffi.NativeType> = R Function();

typedef ArrayFunction0 = FFIFunction0<ffi.Array>;

typedef HandleFunction0 = FFIFunction0<ffi.Handle>;

typedef NativeFunctionFunction0 = FFIFunction0<ffi.NativeFunction>;

typedef OpaqueFunction0 = FFIFunction0<ffi.Opaque>;

typedef SizedNativeTypeFunction0 = FFIFunction0<ffi.SizedNativeType>;

typedef StructFunction0 = FFIFunction0<ffi.Struct>;

typedef UnionFunction0 = FFIFunction0<ffi.Union>;

typedef VarArgsFunction0 = FFIFunction0<ffi.VarArgs>;

typedef VoidFunction0 = FFIFunction0<ffi.Void>;

enum FFIFunction0Types<R extends FFIFunction0> {
  array,
  handle,
  nativeFunction,
  opaque,
  sizedNative,
  struct,
  union,
  varArgs,
  void_;

  const FFIFunction0Types();

  R get type => switch (this) {
    array => ArrayFunction0 as R,
    handle => HandleFunction0 as R,
    nativeFunction => NativeFunctionFunction0 as R,
    opaque => OpaqueFunction0 as R,
    sizedNative => SizedNativeTypeFunction0 as R,
    struct => StructFunction0 as R,
    union => UnionFunction0 as R,
    varArgs => VarArgsFunction0 as R,
    void_ => VoidFunction0 as R,
  };
}
