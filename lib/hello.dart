// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// Modified by William Easdown Babb, 2025.

import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;

import 'package:path/path.dart' as path;

import 'platform_option.dart';

final String helloLibraryPath = 'C_libraries\\hello_library\\build';

// FFI signature of the hello_world C function
typedef HelloWorldFunc = ffi.Void Function();
// Dart type definition for calling the C foreign function
typedef HelloWorld = void Function();

void main() {
  // Open the dynamic library
  // TODO: refactor out path.join by using a List.generate that switches across PlatformOptions.
  final String libraryPath = switch (PlatformOption.current) {
    PlatformOption.linux => path.join(
      Directory.current.path,
      helloLibraryPath,
      'libhello.so',
    ),
    PlatformOption.macOS => path.join(
      Directory.current.path,
      helloLibraryPath,
      'libhello.dylib',
    ),
    PlatformOption.windows => path.join(
      Directory.current.path,
      helloLibraryPath,
      'Debug',
      'hello.dll',
    ),
    _ => throw UnsupportedError(
      'gmat_dart does not support the Platform "${Platform.operatingSystem}".',
    ),
  };

  final dylib = ffi.DynamicLibrary.open(libraryPath);

  // Look up the C function 'hello_world'
  final HelloWorld hello = dylib
      .lookup<ffi.NativeFunction<HelloWorldFunc>>('hello_world')
      .asFunction();
  // Call the function
  hello();
}
