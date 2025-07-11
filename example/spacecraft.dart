import 'package:ffi/ffi.dart';
import 'package:gmat_dart/gmat_dart.dart';

void main() {
  final Spacecraft spacecraft = createSpacecraft(
    'DefaultSpacecraft'.toNativeUtf8(),
  );

  print('Spacecraft name is: ${spacecraft.name}');
}
