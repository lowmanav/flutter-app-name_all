import 'package:flutter_app_name_all/common.dart' as common;
import 'package:flutter_app_name_all/context.dart';
import 'package:xml/xml.dart';

String fetchCurrentBundleName(Context context, String plistFileData) {
  String currentTextFile = common.readFile('lib/index.html');

  return currentTextFile;
}

String setNewBundleName(
  Context context,
  String plistFileData,
  String currentBundleName,
  String desiredBundleName,
) {
  return plistFileData.replaceAll(
    currentBundleName,
    desiredBundleName,
  );
}

void updateLauncherName(Context context) {
  final String indexFileData = common.readFile(context.indexPath);
  final String desiredBundleName = common.fetchLauncherName(context);
  final String currentBundleName = fetchCurrentBundleName(context, indexFileData);
  final String updatedPlistData = setNewBundleName(
    context,
    indexFileData,
    currentBundleName,
    desiredBundleName,
  );

  common.overwriteFile(context.infoPlistPath, updatedPlistData);
}
