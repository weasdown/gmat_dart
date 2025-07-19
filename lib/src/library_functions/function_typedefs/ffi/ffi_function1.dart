import 'dart:ffi' as ffi;

typedef FFIFunction1<R extends ffi.NativeType, A> = R Function(A);

typedef ArrayFunction1<A> = FFIFunction1<ffi.Array, A>;

typedef HandleFunction1<A> = FFIFunction1<ffi.Handle, A>;

typedef NativeFunctionFunction1<A> = FFIFunction1<ffi.NativeFunction, A>;

typedef OpaqueFunction1<A> = FFIFunction1<ffi.Opaque, A>;

typedef SizedNativeTypeFunction1<A> = FFIFunction1<ffi.SizedNativeType, A>;

typedef StructFunction1<A> = FFIFunction1<ffi.Struct, A>;

typedef UnionFunction1<A> = FFIFunction1<ffi.Union, A>;

typedef VarArgsFunction1<A> = FFIFunction1<ffi.VarArgs, A>;

typedef VoidFunction1<A> = FFIFunction1<ffi.Void, A>;
