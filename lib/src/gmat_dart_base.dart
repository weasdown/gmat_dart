// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// Modified by William Easdown Babb, 2025.

import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;

import 'package:path/path.dart' as path;

import '../platform_option.dart';

final String helloLibraryPathRelative = 'C_libraries\\hello_library\\build';

// FFI signature of the hello_world C function
typedef HelloWorldFunc = ffi.Void Function();
// Dart type definition for calling the C foreign function
typedef HelloWorld = void Function();

final String _helloLibraryPath = path.join(
  Directory.current.path,
  helloLibraryPathRelative,
  switch (PlatformOption.current) {
    PlatformOption.linux => 'libhello.so',
    PlatformOption.macOS => 'libhello.dylib',
    PlatformOption.windows => path.join('Debug', 'hello.dll'),
    _ => throw UnsupportedError(
      'gmat_dart does not support the Platform "${Platform.operatingSystem}".',
    ),
  },
);

// Open the dynamic library
final ffi.DynamicLibrary _helloLibrary = ffi.DynamicLibrary.open(
  _helloLibraryPath,
);

// Look up the C function 'hello_world'
final HelloWorld hello = _helloLibrary
    .lookup<ffi.NativeFunction<HelloWorldFunc>>('hello_world')
    .asFunction();
