class Context {
  /// WEB
  final String indexPath;
  final String webManifestPath;

  /// ANDROID
  final String androidManifestPath;
  final String androidBuildGradletPath;

  final String pubspecPath;
  final String yamlKeyName;
  final String infoPlistPath;

  Context({
    required this.indexPath,
    required this.webManifestPath,
    required this.yamlKeyName,
    required this.androidManifestPath,
    required this.androidBuildGradletPath,
    required this.pubspecPath,
    required this.infoPlistPath,
  });
}
