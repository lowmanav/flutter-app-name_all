library flutter_app_name;

import 'package:flutter_app_name/android.dart' as android;
import 'package:flutter_app_name/common.dart';
import 'package:flutter_app_name/context.dart';
import 'package:flutter_app_name/ios.dart' as ios;
import 'package:rename/rename.dart';

void run() {
  final Context context = Context(
    yamlKeyName: 'flutter_app_name',
    pubspecPath: 'pubspec.yaml',
    infoPlistPath: 'ios/Runner/Info.plist',
    androidManifestPath: 'android/app/src/main/AndroidManifest.xml',
  );

  ios.updateLauncherName(context);
  android.updateLauncherName(context);
  final String? id = fetchId(context);
  if (id != null) {
    changeBundleId(id, <Platform>[]);
  }
}
