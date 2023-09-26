import 'package:flutter_app_name_all/common.dart' as common;
import 'package:flutter_app_name_all/context.dart';

String fetchCurrentBundleName(Context context, String indexFileData) {
  const String start = '<meta name="apple-mobile-web-app-title" content="';
  const String end = '">';
  final String changedTextFile = indexFileData;

  final int startIndexTrim = changedTextFile.indexOf(start) + start.length;
  final String textFileWithoutStart = changedTextFile.substring(startIndexTrim).trim();
  final int endIndexTrim = textFileWithoutStart.indexOf(end);
  final String textFileWithoutEnd = textFileWithoutStart.substring(0, endIndexTrim).trim();
  final String currentName = textFileWithoutEnd;
  return currentName;
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
  final String manifestJsonFileData = common.readFile(context.webManifestPath);

  final String desiredBundleName = common.fetchLauncherName(context);
  final String currentBundleName = fetchCurrentBundleName(context, indexFileData);

  final String updatedIndexData = setNewBundleName(
    context,
    indexFileData,
    currentBundleName,
    desiredBundleName,
  );

  common.overwriteFile(context.indexPath, updatedIndexData);

  final String updatedManifestJsonData = setNewBundleName(
    context,
    manifestJsonFileData,
    currentBundleName,
    desiredBundleName,
  );

  common.overwriteFile(context.indexPath, updatedManifestJsonData);
}
