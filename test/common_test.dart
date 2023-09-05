import 'package:flutter_app_name/common.dart';
import 'package:flutter_app_name/context.dart';
import 'package:test/test.dart';

void main() {
  test('Load valid yaml file', () {
    final Context context = Context(
      yamlKeyName: 'flutter_app_name',
      pubspecPath: 'test/test_pubspec_good.yaml',
      infoPlistPath: 'ios/Runner/Info.plist',
      androidManifestPath: 'android/app/src/main/AndroidManifest.xml',
    );

    expect(
      fetchLauncherName(context),
      equals('Flutter App Name'),
    );
  });

  test('Load bad yaml files', () {
    final Context context1 = Context(
      yamlKeyName: 'flutter_app_name',
      pubspecPath: 'test/test_pubspec_bad_parent_key.yaml',
      infoPlistPath: 'ios/Runner/Info.plist',
      androidManifestPath: 'android/app/src/main/AndroidManifest.xml',
    );

    final Context context2 = Context(
      yamlKeyName: 'flutter_app_name',
      pubspecPath: 'test/test_pubspec_bad_name.yaml',
      infoPlistPath: 'ios/Runner/Info.plist',
      androidManifestPath: 'android/app/src/main/AndroidManifest.xml',
    );

    expect(() => fetchLauncherName(context1), throwsA(isA<Exception>()));

    expect(() => fetchLauncherName(context2), throwsA(isA<Exception>()));
  });
}
