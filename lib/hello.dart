// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// Modified by William Easdown Babb, 2025.

import 'dart:ffi' as ffi;
import 'dart:io' show File, Directory, Platform;

import 'package:path/path.dart' as path;

import 'platform_option.dart';

final String helloLibraryRoot = 'C_libraries\\hello_library';
final String helloLibraryBuild = '$helloLibraryRoot\\build';
final File helloLibraryFileRelative = File(switch (PlatformOption.current) {
  PlatformOption.windows => 'Debug\\hello.dll',
  PlatformOption.linux => 'libhello.so',
  PlatformOption.macOS => 'libhello.dylib',
  _ => throw UnsupportedError(
    'gmat_dart does not support the Platform "${Platform.operatingSystem}".',
  ),
});

// FFI signature of the hello_world C function
typedef HelloWorldFunc = ffi.Void Function();
// Dart type definition for calling the C foreign function
typedef HelloWorld = void Function();

void main() {
  // Open the dynamic library
  final String libraryFilePath = path.join(
    Directory.current.path,
    helloLibraryBuild,
    helloLibraryFileRelative.path,
  );

  final dylib = ffi.DynamicLibrary.open(libraryFilePath);

  // Look up the C function 'hello_world'
  final HelloWorld hello = dylib
      .lookup<ffi.NativeFunction<HelloWorldFunc>>('hello_world')
      .asFunction();
  // Call the function
  hello();
}
