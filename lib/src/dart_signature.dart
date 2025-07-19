// /// Typedefs for functions with particular argument and return types.
// library;
//
// // // TODO remove (old implementation)
// // typedef Action0<T> = T Function();
// //
// // typedef Action1<T, A> = T Function(A);
// //
// // typedef Action2<T, A, B> = T Function(A, B);
// //
// // typedef Action3<T, A, B, C> = T Function(A, B, C);
//
// // typedef Function0<T> = T Function();
//
// class Function0<T> {
//   T call() {
//     throw UnimplementedError();
//   }
// }
//
// typedef Function1<T, A> = T Function(A);
//
// typedef Function2<T, A, B> = T Function(A, B);
//
// typedef Function3<T, A, B, C> = T Function(A, B, C);
//
// typedef VoidFunction0 = void Function();
//
// // enum FunctionTypes {
// //   zero,
// //   one,
// //   two,
// //   three;
// //
// //   const FunctionTypes();
// // }
//
// enum VoidFunctionTypes implements FunctionTypes {
//   zero,
//   one,
//   two,
//   three;
//
//   const VoidFunctionTypes();
// }
//
// class FunctionTypes {
//   FunctionTypes._();
//
//   static List<Type> get zero => throw UnimplementedError();
//
//   static List<Type> get one => throw UnimplementedError();
//
//   static List<Type> get two => throw UnimplementedError();
//
//   static List<Type> get three => throw UnimplementedError();
// }
