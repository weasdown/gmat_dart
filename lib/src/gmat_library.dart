import 'dart:ffi';

final String gmatLibraryPath = ''; // FIXME fix path to GMAT library file

final DynamicLibrary gmat = DynamicLibrary.open(gmatLibraryPath);
