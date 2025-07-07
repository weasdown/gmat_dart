import 'dart:io';

import 'cmake.dart';
import 'compile.dart';

/// Compiles then builds a library.
Future<void> generate({
  required String sourceDirectory,
  required String buildDirectory,
  bool printResults = true,
}) async {
  await CMake.build(
    sourceDirectory: Directory(sourceDirectory),
    buildDirectory: Directory(buildDirectory),
  ).then((_) {
    if (printResults) {
      print('- Completed CMake build!\n');
    }
  });

  await compile(workingDirectory: buildDirectory).then((_) {
    if (printResults) {
      print('- Completed compile!');
    }
  });
}
