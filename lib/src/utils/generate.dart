import 'dart:io';

import 'cmake.dart';
import 'compile.dart';

/// Compiles then builds a library.
Future<void> generate({
  required String sourceDirectory,
  required String buildDirectory,
}) async {
  await CMake.build(
    sourceDirectory: Directory(sourceDirectory),
    buildDirectory: Directory(buildDirectory),
  ).then((_) {
    print('- Completed CMake build!\n');
  });

  await compile(workingDirectory: buildDirectory).then((_) {
    print('- Completed compile!');
  });
}
