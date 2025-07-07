import 'dart:io';

import 'package:gmat_dart/platform_option.dart';

extension PathAppend on Directory {
  /// Appends a [path] to this [Directory].
  ///
  /// E.g. if this represents the path `foo`, calling `this / bar` returns a [Directory] representing `foo/bar`.
  Directory operator /(String path) => Directory('${this.path}/$path');
}

abstract interface class CLibrary {
  CLibrary({required this.sourcePath});

  /// Absolute [Directory] where CMake build outputs are saved.
  Directory get buildPath => Directory('$sourcePath/build');

  /// Absolute [Directory] where compiled files are saved.
  Directory get compilePath => PlatformOption.current == PlatformOption.windows
      ? Directory('${buildPath.path}/Debug')
      : buildPath;

  /// Absolute path to the library's C source code.
  final Directory sourcePath;
}
