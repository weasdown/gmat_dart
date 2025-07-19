import 'package:gmat_dart/gmat_dart.dart';

void main() {
  final CLibrary helloLibrary = CLibrary(
    sourceDirectory: librariesDirectory / 'hello',
  );
  print('- Built hello dynamic library.');

  final VoidFunction hello = helloLibrary
      .lookupFunction<VoidFunctionFFI, void Function()>('hello_world');

  print('- Got hello() function from dynamic library.');

  print('- Calling hello():');
  hello();
}
