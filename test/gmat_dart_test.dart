import 'dart:io';

import 'package:gmat_dart/gmat_dart.dart';
import 'package:gmat_dart/hello.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      // TODO add appropriate testing.
      // expect(awesome.isAwesome, isTrue);
    });

    test('utils/generate()', () async {
      await generate(
        sourceDirectory: helloLibraryRoot,
        buildDirectory: helloLibraryBuild,
      );

      final Directory fullDirectory = Directory(helloLibraryRoot).absolute;
      expect(await fullDirectory.exists(), true);
    });
  });
}
