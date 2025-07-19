// import 'dart:ffi' as ffi;
//
// import 'dart_signature.dart';
// import 'library_functions/function_typedefs/ffi/ffi_function0.dart';
//
// // TODO remove commented blocks
//
// // import 'dart_signature.dart';
//
// // // import 'dart_signature.dart';
// // //
// // // /// A general signature for an FFI function.
// // // sealed class FFISignature<T> {
// // //   FFISignature();
// // //
// // //   T call() {
// // //     // TODO: implement call
// // //     throw UnimplementedError('FFISignature.call() is not yet implemented.');
// // //   }
// // //
// // //   Type get dartSignature => switch (this) {
// // //     FFISignature0<T> _ => Function0,
// // //     FFISignature1<dynamic, dynamic> _ => Function1,
// // //     FFISignature2<dynamic, dynamic, dynamic> _ => Function2,
// // //     FFISignature3<dynamic, dynamic, dynamic, dynamic> _ => Function3,
// // //   };
// // // }
// // //
// // // class FFISignature0<T> extends FFISignature<T> {}
// // //
// // // class FFISignature1<T, A> extends FFISignature<T> {}
// // //
// // // class FFISignature2<T, A, B> extends FFISignature<T> {}
// // //
// // // class FFISignature3<T, A, B, C> extends FFISignature<T> {}
// //
// // sealed class FFIFunction<T extends ffi.NativeType> {
// //   FFIFunction();
// //
// //   Function get function;
// // }
// //
// // class FFIFunction0<T extends ffi.NativeType> extends FFIFunction {
// //   FFIFunction0(this._action);
// //
// //   final Function0<T> _action;
// //
// //   T call() => _action();
// //
// //   @override
// //   T Function() get function => _action;
// // }
// //
// // class FFIVoidFunction0 extends FFIFunction0<ffi.Void> {
// //   FFIVoidFunction0(super.action);
// // }
// //
// // class FFIFunction1<T extends ffi.NativeType, A> extends FFIFunction {
// //   FFIFunction1(this._action);
// //
// //   final Function1<T, A> _action;
// //
// //   T call(A arg0) => _action(arg0);
// //
// //   @override
// //   T Function(A) get function => _action;
// // }
// //
// // class FFIFunction2<T extends ffi.NativeType, A, B> extends FFIFunction {
// //   FFIFunction2(this._action);
// //
// //   final Function2<T, A, B> _action;
// //
// //   T call(A arg0, B arg1) => _action(arg0, arg1);
// //
// //   @override
// //   T Function(A, B) get function => _action;
// // }
// //
// // class FFIFunction3<T extends ffi.NativeType, A, B, C> extends FFIFunction {
// //   FFIFunction3(this._action);
// //
// //   final Function3<T, A, B, C> _action;
// //
// //   T call(A arg0, B arg1, C arg2) => _action(arg0, arg1, arg2);
// //
// //   @override
// //   T Function(A, B, C) get function => _action;
// // }
//
// typedef NT = ffi.NativeType;
//
// sealed class FFIFunction<NT> {
//   // NT call();
//
//   // Type get type;
// }
//
// class FFIFunction0<R> extends FFIFunction<R> {
//   R call() {
//     // TODO: implement call
//     throw UnimplementedError();
//   }
//
//   // @override
//   // // TODO: implement type
//   // Type get type => throw UnimplementedError();
// }
//
// // class FFIVoidFunction0 extends FFIFunction<ffi.Void> {
// //   @override
// //   // TODO: implement type
// //   Type get type => _FFIVoidFunction0;
// // }
//
// class FFIFunction1<R, A> extends FFIFunction<R> {
//   R call(A arg0) {
//     // TODO: implement call
//     throw UnimplementedError();
//   }
//
//   // @override
//   // // TODO: implement type
//   // Type get type => throw UnimplementedError();
// }
//
// class FFIFunction2<R, A, B> extends FFIFunction<R> {
//   R call(A arg0, B arg1) {
//     // TODO: implement call
//     throw UnimplementedError();
//   }
//
//   // @override
//   // // TODO: implement type
//   // Type get type => throw UnimplementedError();
// }
//
// class FFIFunction3<R, A, B, C> extends FFIFunction<R> {
//   R call(A arg0, B arg1, C arg2) {
//     // TODO: implement call
//     throw UnimplementedError();
//   }
//
//   // @override
//   // // TODO: implement type
//   // Type get type => throw UnimplementedError();
// }
//
// // typedef FFIFunction0<T extends ffi.NativeType> = ffi.NativeFunction;
// //
// // typedef FFIFunction1<T extends ffi.NativeType, A> = ffi.NativeFunction;
//
// // typedef FFIFunction1<T extends ffi.NativeType, A> = T Function(A);
// //
// // typedef FFIFunction2<T extends ffi.NativeType, A, B> = T Function(A, B);
// //
// // typedef FFIFunction3<T extends ffi.NativeType, A, B, C> = T Function(A, B, C);
//
// // typedef FFIVoidFunction0 = Function0<ffi.Void>;
//
// class FFIVoidFunction0 extends Function0<ffi.Void> {}
//
// class FFIFunctionTypes {
//   FFIFunctionTypes._();
//   //
//   // static final List<Type> _ffiTypes = [
//   //   ffi.Array,
//   //   ffi.Handle,
//   //   ffi.NativeFunction,
//   //   ffi.Opaque,
//   //   ffi.SizedNativeType,
//   //   ffi.Struct,
//   //   ffi.Union,
//   //   ffi.VarArgs,
//   //   ffi.Void,
//   // ];
//
//   static List<Type> get zero => List<Type>.from(
//     FFIFunction0Types.values.map(
//       (FFIFunction0Types typeOption) => typeOption.type,
//     ),
//   )
//   //[ArrayFunction0]
//   // List<Type>.from(
//   //   _ffiTypes.map((Type returnType) {
//   //     return FFIFunction0<returnType>;
//   //   }),
//   // )
//   ;
//
//   static List<Type> get one => throw UnimplementedError();
//
//   static List<Type> get two => throw UnimplementedError();
//
//   static List<Type> get three => throw UnimplementedError();
// }
