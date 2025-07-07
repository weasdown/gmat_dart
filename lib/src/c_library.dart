import 'package:gmat_dart/platform_option.dart';

abstract interface class CLibrary {
  CLibrary({required this.sourcePath});

  /// Absolute [Directory] where CMake build outputs are saved.
  String get buildPath => '$sourcePath/build';

  /// Absolute [Directory] where compiled files are saved.
  String get compilePath => PlatformOption.current == PlatformOption.windows
      ? '$buildPath/Debug'
      : buildPath;

  /// Absolute path to the library's C source code.
  final String sourcePath;
}
