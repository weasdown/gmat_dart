import 'dart:ffi' as ffi;
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
  Directory get buildDirectory => Directory('${sourceDirectory.path}/build');

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

  /// Gets a function
  Function getFunction<
    R extends ffi.NativeType
    // T extends ffi.NativeFunction<R>,
    // T extends Function,
    // F extends Function
  >({
    required String name,
    // TODO convert to general FFIFunction, to not restrict number of arguments.
    // required Type ffiSignature,
    // required Type dartSignature,
    List<Type> argTypes = const [],
  }) {
    // TODO remove commented code
    // // final HelloWorld hello = library
    // //     .lookup<ffi.NativeFunction<HelloWorldFunc>>(functionName)
    // //     .asFunction();
    // final Function0<ffi.Void> function = library
    //     .lookup<ffi.NativeFunction<FFIVoidFunction0>>(functionName)
    //     .asFunction();

    // Look up the C function 'hello_world'

    // Check R is a subtype of NativeType, rather than NativeType itself.
    if (R.toString() == 'NativeType') {
      throw ArgumentError.value(
        R,
        'R',
        'must be a subtype of NativeType, not a NativeType itself. \n\t- Check '
            'you have passed a type parameter to getFunction(), to call it as '
            'getFunction<T>(), where T is a subtype of NativeType. ',
      );
    }

    return switch (argTypes.length) {
      0 => _getFunction0<R>(name: name),
      1 => _getFunction1<R>(name: name, A: argTypes.first),
      2 => _getFunction2<R>(name: name, A: argTypes.first, B: argTypes[1]),
      3 => _getFunction3<R>(
        name: name,
        A: argTypes.first,
        B: argTypes[1],
        C: argTypes[2],
      ),
      _ => throw UnsupportedError(
        'No more than three function arguments are currently supported.',
      ),
    };

    // return library.lookupFunction<
    //     ffi.Void Function(),
    // // ArrayFunction0,
    //     void Function()
    // // dartSignature
    // >(name);
    //
    // // // TODO use example to help implement other signatures.
    // // return library.lookupFunction<
    // //   ffi.Int32 Function(ffi.Int32, ffi.Int32),
    // //   int Function(int, int)
    // // >(functionName);
  }

  /// Gets a function that takes no arguments, from its [name].
  Function _getFunction0<R extends ffi.NativeType>({required String name}) =>
      switch (R.toString()) {
        'Void' => library.lookupFunction<ffi.Void Function(), void Function()>(
          name,
        ),
        _ => throw UnimplementedError(
          'Handling of return type ${R.toString()} is not yet implemented.',
        ),
      };

  /// Gets a function that takes one argument, from its [name].
  Function _getFunction1<R extends ffi.NativeType>({
    required String name,
    required Type A,
  }) {
    throw UnimplementedError(
      'CLibrary._getFunction1() is not yet implemented.',
    );
    //
    // // // Function getFromAType<
    // // //   Function1R extends ffi.NativeType,
    // // //   Function1A extends ffi.NativeType
    // // // >() {
    // // //   return switch (Function1R.runtimeType) {
    // // //     == ffi.Array => throw UnimplementedError(),
    // // //     // TODO: Handle this case.
    // // //     _ => throw UnimplementedError(),
    // // //   };
    // // // }
    //
    // return switch (R.runtimeType) {
    //   // The return type will be ffi.Void.
    //   == ffi.Void => switch (A.runtimeType) {
    //     // The argument type will be ffi.Array.
    //     == ffi.Array =>
    //       library.lookupFunction<ffi.Void Function(A), void Function(int)>(
    //         name,
    //       ), //getFromAType<ffi.Void>(),
    //     // ffi.Void does not make sense as an argument type for a function that explicitly has an argument.
    //     == ffi.Void => throw TypeError(),
    //     _ => throw UnimplementedError(),
    //   },
    //   _ => throw UnimplementedError(),
    // };
  }

  /// Gets a function that takes two arguments, from its [name].
  Function _getFunction2<R extends ffi.NativeType>({
    required String name,
    required Type A,
    required Type B,
  }) {
    throw UnimplementedError(
      'CLibrary._getFunction2() is not yet implemented.',
    );
  }

  /// Gets a function that takes three arguments, from its [name].
  Function _getFunction3<R extends ffi.NativeType>({
    required String name,
    required Type A,
    required Type B,
    required Type C,
  }) {
    throw UnimplementedError(
      'CLibrary._getFunction3() is not yet implemented.',
    );
  }

  /// Opens the dynamic library file.
  ffi.DynamicLibrary get library => ffi.DynamicLibrary.open(_libraryFile.path);

  /// Gets the absolute path to the dynamic library file stored in the [compileDirectory].
  File get _libraryFile =>
      File(path.join(buildDirectory.path, _libraryFileRelative.path)).absolute;

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
