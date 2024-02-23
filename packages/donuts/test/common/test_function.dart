import 'dart:io';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:path/path.dart' as p;

/// Returns a [LibraryReader] for library specified by [targetLibraryFileName]
/// using the files in [sourceDirectory].
Future<LibraryReader> initializeLibraryReaderForDirectoryWithDirectory(
  String sourceDirectory,
  String targetLibraryFileName,
) async {
  final dir = p.join(sourceDirectory, p.dirname(targetLibraryFileName));

  final map = Map.fromEntries(
    Directory(dir)
        .listSync()
        .whereType<File>()
        .map((f) => MapEntry(p.basename(f.path), f.readAsStringSync())),
  );

  try {
    return await initializeLibraryReaderWithDirectory(
      map,
      p.basename(targetLibraryFileName),
      p.dirname(targetLibraryFileName),
    );
  } on ArgumentError catch (e) // ignore: avoid_catching_errors
  {
    if (e.message == 'Must exist as a key in `contentMap`.') {
      throw ArgumentError.value(
        targetLibraryFileName,
        'targetLibraryFileName',
        'Must exist as a file in `sourceDirectory`.',
      );
    }
    rethrow;
  }
}

const testPackageName = '__test__';
Future<LibraryReader> initializeLibraryReaderWithDirectory(
  Map<String, String> contentMap,
  String targetLibraryFileName,
  String parentDir,
) async {
  if (!contentMap.containsKey(targetLibraryFileName)) {
    throw ArgumentError.value(
      targetLibraryFileName,
      'targetLibraryFileName',
      'Must exist as a key in `contentMap`.',
    );
  }

  String assetIdForFile(String fileName) => '$testPackageName|lib/$parentDir/$fileName';

  final targetLibraryAssetId = assetIdForFile(targetLibraryFileName);

  final assetMap = contentMap.map((file, content) => MapEntry(assetIdForFile(file), content));

  final library = await resolveSources(
    assetMap,
    (item) async {
      final assetId = AssetId.parse(targetLibraryAssetId);
      return item.libraryFor(assetId);
    },
    resolverFor: targetLibraryAssetId,
  );

  return LibraryReader(library);
}
