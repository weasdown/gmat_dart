import 'dart:ffi' as ffi;
import 'dart:io';

import 'package:gmat_dart/src/c_library.dart';
import 'package:test/test.dart';

void main() {
  final Directory librariesDirectory = Directory('C_libraries');

  group('CLibrary', () {
    test('Build for hello_library', () {
      final CLibrary helloLibrary = CLibrary(
        sourceDirectory: librariesDirectory / 'hello',
      );

      expect(helloLibrary.name, 'hello');

      final void Function() hello =
          helloLibrary.getFunction<ffi.Void>(name: 'hello_world')
              as void Function();

      expect(hello, isA<void Function()>());

      print('\nCalling hello():');
      hello();
    });

    // TODO implement test for running created library
  });
}
