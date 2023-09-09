import 'package:flutter_app_name_all/common.dart' as common;
import 'package:flutter_app_name_all/context.dart';
import 'package:xml/xml.dart';

String fetchCurrentBundleName(Context context, String plistFileData) {
  final XmlDocument parsed = XmlDocument.parse(plistFileData);

  final Iterable<XmlElement> allKeys = parsed.findAllElements('key');
  final List<XmlElement> allValues = parsed.findAllElements('string').toList();

  String? bundleName;

  allKeys.toList().asMap().forEach((int key, XmlElement val) {
    if (val.toString().contains('CFBundleName')) {
      bundleName = allValues[key].toString();
    }
  });

  if (bundleName == null) {
    throw Exception(
      'Bundle name not found in ${context.infoPlistPath}. '
      'Info.plist might be corrupt.',
    );
  }

  return bundleName!;
}

String setNewBundleName(
  Context context,
  String plistFileData,
  String currentBundleName,
  String desiredBundleName,
) {
  return plistFileData.replaceAll(
    currentBundleName,
    '<string>$desiredBundleName</string>',
  );
}

void updateLauncherName(Context context) {
  final String plistFileData = common.readFile(context.infoPlistPath);
  final String desiredBundleName = common.fetchLauncherName(context);
  final String currentBundleName = fetchCurrentBundleName(context, plistFileData);
  final String updatedPlistData = setNewBundleName(
    context,
    plistFileData,
    currentBundleName,
    desiredBundleName,
  );

  common.overwriteFile(context.infoPlistPath, updatedPlistData);
}
