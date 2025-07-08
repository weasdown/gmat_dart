import 'dart:ffi' as ffi;

import 'package:gmat_dart/gmat_dart.dart';

void main() {
  final CLibrary helloLibrary = CLibrary(
    sourceDirectory: librariesDirectory / 'hello',
  );
  print('- Built hello dynamic library.');

  final void Function() hello =
      helloLibrary.getFunction<ffi.Void>(name: 'hello_world')
          as void Function();

  print('- Got hello() function from dynamic library.');

  print('- Calling hello():');
  hello();
}
