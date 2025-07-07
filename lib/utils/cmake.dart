/// @docImport: 'compile.dart';
library;

import 'dart:io' show Process;

/// Abstract interface class for building libraries using CMake.
///
/// To compile a library once built, use [compile()].
abstract interface class CMake {
  /// Build a library using CMake.
  static Future<void> build({
    required String sourceDirectory,
    required String buildDirectory,
  }) async {
    await Process.run('cmake', [
      sourceDirectory,
    ], workingDirectory: buildDirectory);
  }
}
