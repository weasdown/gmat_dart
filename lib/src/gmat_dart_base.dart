// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// Modified by William Easdown Babb, 2025.

import 'dart:ffi';
import 'dart:io' show Platform, Directory;

import 'package:path/path.dart' as path;

import '../function_typedefs.dart';
import '../platform_option.dart';

final String helloLibraryPathRelative = 'C_libraries\\hello\\build';

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
final DynamicLibrary _helloLibrary = DynamicLibrary.open(_helloLibraryPath);

// Look up the C function 'hello_world'
final VoidFunction hello = _helloLibrary
    .lookup<NativeFunction<VoidFunctionFFI>>('hello_world')
    .asFunction();
