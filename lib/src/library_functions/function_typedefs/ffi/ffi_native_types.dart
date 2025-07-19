library;

import 'dart:ffi' as ffi;

/// Enum for accessing the subtypes of [NativeType].
enum FFINativeType {
  array,
  handle,
  nativeFunction,
  opaque,
  sizedNative,
  struct,
  union,
  varArgs,

  /// Has `_` appended to avoid conflicting with Dart's built-in `void`.
  void_;

  const FFINativeType();

  Type get type => switch (this) {
    FFINativeType.array => ffi.Array,
    FFINativeType.handle => ffi.Handle,
    FFINativeType.nativeFunction => ffi.NativeFunction,
    FFINativeType.opaque => ffi.Opaque,
    FFINativeType.sizedNative => ffi.SizedNativeType,
    FFINativeType.struct => ffi.Struct,
    FFINativeType.union => ffi.Union,
    FFINativeType.varArgs => ffi.VarArgs,
    FFINativeType.void_ => ffi.Void,
  };
}
