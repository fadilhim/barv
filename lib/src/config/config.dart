/// A static class that represents application wide configuration.
class EnvConfig {
  const EnvConfig._();

  /// Available build variant: 'staging' and 'production'
  static const String buildVariant = String.fromEnvironment(
    'BUILD_VARIANT',
    defaultValue: 'staging',
  );
  static const bool debug = buildVariant == 'staging' ||
      bool.hasEnvironment('DEBUG') && String.fromEnvironment('DEBUG') == 'true';

  static const String encryptKey = 'pokjuRq5x72Es54RLJGDJe5MZ6Unfasd';
}
