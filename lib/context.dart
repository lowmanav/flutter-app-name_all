class Context {
  final String indexPath;
  final String infoPlistPath;
  final String androidManifestPath;
  final String pubspecPath;
  final String yamlKeyName;

  Context({
    required this.indexPath,
    required this.yamlKeyName,
    required this.androidManifestPath,
    required this.pubspecPath,
    required this.infoPlistPath,
  });
}
