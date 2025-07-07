import 'dart:io' show Platform, Process;
import 'package:path/path.dart' as path;

/// Compiles a library using the correct compiler for the platform.
Future<void> compile({
  required String workingDirectory,
  int vsYear = 2022,
  String vsEdition = 'Community',
}) async {
  // Compile library.
  if (Platform.isWindows) {
    final String libraryName = path.basename(workingDirectory);

    // Run 'msbuild' from Visual Studio.
    await Process.run(
      'C:\\Program Files\\Microsoft Visual Studio\\$vsYear\\$vsEdition\\MSBuild\\Current\\Bin\\MSBuild.exe',
      ['$libraryName.sln'],
      workingDirectory: workingDirectory,
    );
  } else {
    // Run 'make'.
    await Process.run('make', [], workingDirectory: workingDirectory);
  }
}
