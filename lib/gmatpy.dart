// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// Modified by William Easdown Babb, 2025.

import 'dart:ffi' as ffi;
import 'dart:io' show Directory;

import 'package:path/path.dart' as path;

final String gmatpyPath = 'C_libraries\\gmatpy_2025\\_py312';

// FFI signature of the hello_world C function
typedef HelloWorldFunc = ffi.Void Function();
// Dart type definition for calling the C foreign function
typedef HelloWorld = void Function();

void main() {
  // Open the dynamic library
  final String libraryPath = path.join(
    Directory.current.path,
    gmatpyPath,
    '_gmat_py.pyd',
    // '_gmat_py.dll',
  );

  final ffi.DynamicLibrary dylib = ffi.DynamicLibrary.open(libraryPath);

  print('dylib opened!');

  print(dylib.handle);

  // // TODO implement function calls for _gmat_py
  // // Look up the C function 'hello_world'
  // final HelloWorld hello = dylib
  //     .lookup<ffi.NativeFunction<HelloWorldFunc>>('hello_world')
  //     .asFunction();
  // // Call the function
  // hello();
}
