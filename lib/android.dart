import 'package:flutter_app_name_all/common.dart' as common;
import 'package:flutter_app_name_all/context.dart';
import 'package:xml/xml.dart';

String fetchCurrentBundleName(Context context, String manifestFileData) {
  final XmlDocument parsed = XmlDocument.parse(manifestFileData);

  final XmlElement application = parsed.findAllElements('application').toList()[0];

  final List<String> label = application.attributes
      .where(
        (XmlAttribute attrib) => attrib.toString().contains('android:label'),
      )
      .map((XmlAttribute i) => i.toString())
      .toList();

  if (label.isEmpty) {
    throw Exception(
      'Could not find android:label in ${context.androidManifestPath}',
    );
  }

  return label[0];
}

String setNewBundleName(
  Context context,
  String manifestFileData,
  String currentBundleName,
  String desiredBundleName,
) {
  return manifestFileData.replaceAll(
    currentBundleName,
    'android:label="$desiredBundleName"',
  );
}

void updateLauncherName(Context context) {
  final String manifestFileData = common.readFile(context.androidManifestPath);
  final String desiredBundleName = common.fetchLauncherName(context);
  final String currentBundleName = fetchCurrentBundleName(context, manifestFileData);
  final String updatedManifestData = setNewBundleName(
    context,
    manifestFileData,
    currentBundleName,
    desiredBundleName,
  );

  common.overwriteFile(context.androidManifestPath, updatedManifestData);
}
