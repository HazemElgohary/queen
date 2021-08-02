import 'package:flutter/cupertino.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../queen.dart';

class Pick {
  Pick._();

  static Future<File?> image(BuildContext context) async {
    final result = await AssetPicker.pickAssets(
      context,
      maxAssets: 1,
      requestType: RequestType.image,
    );
    if (result != null && result.isNotEmpty) {
      return result.first.file;
    }
  }

  static Future<List<File>?> multiImages(
    BuildContext context, {
    int maxCount = 9,
  }) async {
    final result = await AssetPicker.pickAssets(
      context,
      maxAssets: maxCount,
      requestType: RequestType.image,
    );
    if (result != null && result.isNotEmpty) {
      final _files = <File>[];
      for (final asset in result) {
        final _assetFile = await asset.file;
        if (_assetFile != null) {
          _files.add(_assetFile);
        }
      }
      return _files;
    }
  }
}
