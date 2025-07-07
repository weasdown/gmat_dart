import 'dart:io' show Platform;

/// Enum to simplify finding and using the current [Platform].
enum PlatformOption {
  linux,
  macOS,
  windows,
  android,
  iOS,
  fuchsia;

  const PlatformOption();

  String get text => name.toLowerCase();

  /// Gets the [PlatformOption] that matches the current [Platform], or throws an [UnsupportedError] if no match found.
  static PlatformOption get current {
    final PlatformOption? matchingOption = PlatformOption.values
        .where(
          (PlatformOption option) => option.name == Platform.operatingSystem,
        )
        .firstOrNull;

    if (matchingOption != null) {
      return matchingOption;
    } else {
      throw UnsupportedError(
        'The Platform "${Platform.operatingSystem}" is not supported.',
      );
    }
  }
}
