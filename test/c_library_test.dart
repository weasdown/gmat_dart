import 'package:gmat_dart/gmat_dart.dart';
import 'package:test/test.dart';

void main() {
  group('CLibrary', () {
    test('Build for hello_library', () {
      final CLibrary helloLibrary = CLibrary(
        sourceDirectory: librariesDirectory / 'hello',
      );

      expect(helloLibrary.name, 'hello');

      // // TODO reinstate working version
      // final void Function() hello =
      //     helloLibrary.getFunction<ffi.Void>(name: 'hello_world')
      //         as void Function();

      // // final Function hello = helloLibrary
      // //     .lookupFunction<ffi.Int Function(), int Function()>('hello_world');
      //
      final void Function() hello = FFIVoidFunction0(
        library: helloLibrary,
        name: 'hello_world',
      ).toDartFunction();
      // hello();
      //
      // // final Function hello = helloLibrary
      // //     .lookup<void Function(), ffi.NativeFunction<void Function()>>(
      // //       'hello_world',
      // //     );

      // DartVoidFunction0 helloDF =
      //     hello.toDartFunction().call() as DartVoidFunction0;

      // expect(hello.dartFunction, isA<void Function()>());

      expect(hello, isA<void Function()>());

      print('\nCalling hello():');
      hello();
    });

    // TODO implement test for running created library
  });
}
