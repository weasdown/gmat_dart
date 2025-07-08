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

      // TODO add expect
    });

    // TODO implement test for running created library
  });
}
