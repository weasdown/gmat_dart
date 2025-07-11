import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../gmat_library.dart';

/// Model of GMAT's `Spacecraft` class.
final class Spacecraft extends Struct {
  external Pointer<Utf8> name;
}

// C function: TBC // struct Coordinate create_coordinate(double latitude, double longitude)
typedef CreateSpacecraftNative = Spacecraft Function(Pointer<Utf8> name);
typedef CreateSpacecraft = Spacecraft Function(Pointer<Utf8> name);

/// A zero-argument function that returns a string.
typedef StringGetter = Pointer<Utf8> Function();

final createSpacecraft = gmat
    .lookupFunction<CreateSpacecraftNative, CreateSpacecraft>(
      'create_spacecraft',
    );
