import 'dart:ffi';
import 'dart:io';

import 'package:path/path.dart' as path;

import '../platform_option.dart';

extension PathAppend on Directory {
  /// Appends a [path] to this [Directory].
  ///
  /// E.g. if this represents the path `foo`, calling `this / bar` returns a [Directory] representing `foo/bar`.
  Directory operator /(String path) => Directory('${this.path}/$path');
}

interface class CLibrary {
  CLibrary({
    required Directory sourceDirectory,
    bool makeDirectory = false,
    String? name,
  }) : sourceDirectory = sourceDirectory.absolute,
       _name = name ?? path.basename(sourceDirectory.path) {
    _validateSourceDirectory(makeDirectory);
  }

  /// Runs CMake on the [sourceDirectory] to produce build files in the [buildDirectory].
  Future<void> build() {
    throw UnimplementedError('CLibrary.build() is not yet implemented.');
  }

  /// Absolute [Directory] where CMake build outputs are saved.
  Directory get buildDirectory => Directory('$sourceDirectory/build');

  /// Compiles the build files in the [buildDirectory] to produce a dynamic library file.
  Future<void> compile({
    int vsYear = 2022,
    String vsEdition = 'Community',
  }) async {
    // Compile library.
    if (Platform.isWindows) {
      // If the buildDirectory does not exist, create it.
      Directory(buildDirectory.path).create();

      final String msbuildPath =
          'C:\\Program Files\\Microsoft Visual Studio\\$vsYear\\$vsEdition\\MSBuild\\Current\\Bin';

      // Run 'msbuild' from Visual Studio.
      await Process.run('$msbuildPath\\MSBuild.exe', [
        '$name.sln',
      ], workingDirectory: buildDirectory.path);
    } else {
      // Run 'make'.
      await Process.run('make', [], workingDirectory: buildDirectory.path);
    }
  }

  /// Absolute [Directory] where compiled files are saved.
  Directory get compileDirectory =>
      PlatformOption.current == PlatformOption.windows
      ? Directory('${buildDirectory.path}/Debug')
      : buildDirectory;

  /// Runs [build] then [compile].
  Future<void> generate() {
    throw UnimplementedError('CLibrary.generate() is not yet implemented.');
  }

  /// Opens the dynamic library file.
  DynamicLibrary get library => DynamicLibrary.open(_libraryFile.path);

  /// Gets the absolute path to the dynamic library file stored in the [compileDirectory].
  File get _libraryFile => File(
    path.join(
      Directory.current.path,
      buildDirectory.path,
      _libraryFileRelative.path,
    ),
  );

  /// Gets the relative path to the dynamic library file stored in the [compileDirectory].
  File get _libraryFileRelative => File(switch (PlatformOption.current) {
    PlatformOption.windows => 'Debug\\$name.dll',
    PlatformOption.linux => 'lib$name.so',
    PlatformOption.macOS => 'lib$name.dylib',
    _ => throw UnsupportedError(
      'gmat_dart does not support the Platform "${Platform.operatingSystem}".',
    ),
  });

  final String _name;

  /// The name of this library.
  String get name => _name;

  /// Absolute path to the library's C source code.
  final Directory sourceDirectory;

  Future<void> _validateSourceDirectory(bool makeDirectory) async {
    if (await sourceDirectory.exists()) {
      return;
    }
    // sourceDirectory does not exist.
    else {
      // The user expected the sourceDirectory to already exist, so throw an error.
      if (!makeDirectory) {
        throw ArgumentError.value(
          sourceDirectory,
          'sourceDirectory',
          'this directory does not exist. Please pass an existing directory to '
              'the CLibrary constructor, or set the makeDirectory argument to true.',
        );
      }
      // sourceDirectory does not currently exist but the user has allowed it to be created during the building of the CLibrary.
      else {
        // Create the sourceDirectory then validate that sourceDirectory now exists.
        sourceDirectory.create(recursive: true);
        _validateSourceDirectory(false);
      }
    }
  }
}
