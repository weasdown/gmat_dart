import 'dart:io';

import 'package:path/path.dart' as path;

import '../platform_option.dart';

extension PathAppend on Directory {
  /// Appends a [path] to this [Directory].
  ///
  /// E.g. if this represents the path `foo`, calling `this / bar` returns a [Directory] representing `foo/bar`.
  Directory operator /(String path) => Directory('${this.path}/$path');
}

abstract interface class CLibrary {
  CLibrary({required this.sourceDirectory, String? name})
    : _name = name ?? path.basename(path.dirname(sourceDirectory.path));

  /// Absolute [Directory] where CMake build outputs are saved.
  Directory get buildDirectory => Directory('$sourceDirectory/build');

  /// Absolute [Directory] where compiled files are saved.
  Directory get compileDirectory =>
      PlatformOption.current == PlatformOption.windows
      ? Directory('${buildDirectory.path}/Debug')
      : buildDirectory;

  final String _name;

  /// The name of this library.
  String get name => _name;

  /// Absolute path to the library's C source code.
  final Directory sourceDirectory;

  /// Runs CMake on the [sourceDirectory] to produce build files in the [buildDirectory].
  Future<void> build() {
    throw UnimplementedError('CLibrary.build() is not yet implemented.');
  }

  /// Compiles the build files in the [buildDirectory] to produce a dynamic library file.
  Future<void> compile() {
    throw UnimplementedError('CLibrary.compile() is not yet implemented.');
  }

  /// Runs [build] then [compile].
  Future<void> generate() {
    throw UnimplementedError('CLibrary.generate() is not yet implemented.');
  }
}
