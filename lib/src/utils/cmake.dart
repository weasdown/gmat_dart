/// @docImport: 'compile.dart';
library;

import 'dart:io';

/// Abstract interface class for building libraries using CMake.
///
/// To compile a library once built, use [compile()].
abstract interface class CMake {
  /// Build a library using CMake.
  static Future<void> build({
    required Directory sourceDirectory,
    required Directory buildDirectory,
  }) async {
    if (!sourceDirectory.isAbsolute) {
      sourceDirectory = sourceDirectory.absolute;
    }

    if (!buildDirectory.isAbsolute) {
      buildDirectory = buildDirectory.absolute;
    }

    // If the buildDirectory does not exist, create it.
    buildDirectory.create();

    await Process.run('cmake', [
      sourceDirectory.path,
    ], workingDirectory: buildDirectory.path);
  }
}
