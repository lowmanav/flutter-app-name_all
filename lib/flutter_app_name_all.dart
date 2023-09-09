library flutter_app_name_all;

import 'package:flutter_app_name_all/android.dart' as android;
import 'package:flutter_app_name_all/common.dart';
import 'package:flutter_app_name_all/context.dart';
import 'package:flutter_app_name_all/ios.dart' as ios;
import 'package:rename/rename.dart';

void run() {
  final Context context = Context(
    yamlKeyName: 'flutter_app_name_all',
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
