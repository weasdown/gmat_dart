import 'dart:io';

import 'package:path/path.dart' as path;

/// Compiles a library using the correct compiler for the platform.
Future<void> compile({
  required String workingDirectory,
  int vsYear = 2022,
  String vsEdition = 'Community',
}) async {
  // Compile library.
  if (Platform.isWindows) {
    final String libraryName = path.basename(path.dirname(workingDirectory));

    // If the workingDirectory does not exist, create it.
    Directory(workingDirectory).create();

    final String msbuildPath =
        'C:\\Program Files\\Microsoft Visual Studio\\$vsYear\\$vsEdition\\MSBuild\\Current\\Bin';

    // Run 'msbuild' from Visual Studio.
    await Process.run('$msbuildPath\\MSBuild.exe', [
      '$libraryName.sln',
    ], workingDirectory: workingDirectory);
  } else {
    // Run 'make'.
    await Process.run('make', [], workingDirectory: workingDirectory);
  }
}
