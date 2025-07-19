import 'dart:ffi' as ffi;

import '../c_library.dart';
import 'dart_function.dart';

/// The most general type of ffi function, which can have any return type and
/// any number of arguments.
sealed class FFIFunction<R, S extends Function> {
  FFIFunction({required this.library, required this.name});

  // R call();

  final CLibrary library;

  Function lookup(CLibrary library);

  final String name;

  ffi.Pointer<ffi.NativeFunction<S>> get pointer =>
      library.library.lookup<ffi.NativeFunction<S>>(name);

  @override
  Type get runtimeType => S;

  Function toDartFunction();
}

sealed class FFIFunction0<R, S extends R Function()> extends FFIFunction<R, S> {
  FFIFunction0({required super.library, required super.name});

  // @override
  // R call();

  @override
  Function lookup(CLibrary library);
}

class FFIVoidFunction0 extends FFIFunction0<ffi.Void, ffi.Void Function()> {
  FFIVoidFunction0({required super.library, required super.name});

  @override
  void Function() lookup(CLibrary library) {
    // TODO: implement lookup
    // throw UnimplementedError();

    // final HelloWorld hello = dylib
    //     .lookup<NativeFunction<Void Function()>>('hello_world')
    //     .asFunction<void Function()>();

    return pointer.asFunction<void Function()>();

    // return library.lookup(name);
  }

  // ffi.Void Function()? _nativeFunction;

  void Function()? _dartFunction;

  Function get dartFunction => lookup(library);

  // @override
  void call() {
    _dartFunction ??= lookup(library);

    return _dartFunction!.call();

    // // TODO: implement call
    // throw UnimplementedError();
  }

  @override
  Type get runtimeType => pointer.asFunction<void Function()>().runtimeType;

  @override
  void Function() toDartFunction() {
    // TODO: implement toDartFunction
    // throw UnimplementedError();
    // return this as DartVoidFunction0;
    return (DartFunction0.fromFFIFunction0(
                  this,
                  // this as FFIFunction0<ffi.Void, ffi.Void Function()>,
                )
                as DartVoidFunction0)
            .function
        as void Function();
  }
}

// TODO add FFIFunction1, FFIFunction2, FFIFunction3.
