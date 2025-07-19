import 'ffi_function.dart';

sealed class DartFunction<R, S extends Function> {
  const DartFunction(this.name, this.function);

  R call() => function.call();

  final Function function;

  final String name;
}

sealed class DartFunction0<R, S extends R Function()>
    extends DartFunction<R, S> {
  const DartFunction0(super.name, super.function);

  factory DartFunction0.fromFFIFunction0(FFIFunction0<R, S> ffiFunction) =>
      switch (ffiFunction) {
        FFIVoidFunction0() =>
          DartVoidFunction0._(
                ffiFunction.name,
                ffiFunction.library.lookup(ffiFunction.name),
                // .getFunction<NativeFunction<ffi.Void Function()>>(
                //   name: ffiFunction.name,
                // ),
              )
              as DartFunction0<R, S>,
        // DartVoidFunction0._ as DartFunction0<R, S>,
        // FFIFunction0 _ => throw UnimplementedError(),
      };
  // {
  //   print('R == ffi.Void: ${R == ffi.Void}');
  //   return switch (R) {
  //     == ffi.Void => DartVoidFunction0() as DartFunction0<R, S>,
  //     // TODO: Handle this case.
  //     _ => throw UnimplementedError(),
  //   };
  // }
}

class DartVoidFunction0 extends DartFunction0<void, void Function()>
// implements FFIVoidFunction0
// implements DartFunction0<void, void Function()>
{
  const DartVoidFunction0._(super.name, super.function);

  factory DartVoidFunction0.fromFFIFunction0(FFIVoidFunction0 ffiFunction) =>
      DartVoidFunction0._(
        ffiFunction.name,
        ffiFunction.library.getFunction(name: ffiFunction.name),
      );

  @override
  void call() {
    // TODO: implement call
  }
}
