import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper/widgets/custon_snack.dart';
import 'package:wallpaper/widgets/loading.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:gallery_saver/files.dart';
import 'package:http/http.dart' as http;

class ImageViewController extends GetxController {
  XFile? downloadedImage;

  Future<void> setWallpaper(String imageUrl, location) async {
    var file = await DefaultCacheManager().getSingleFile(imageUrl);
    if (location != "" && location != null) {
      try {
        customLoading(true);
        WallpaperManagerFlutter().setwallpaperfromFile(file, location);
        Timer(const Duration(seconds: 2), () {
          customLoading(false);
          customSnackBar(msg: 'wallpaper updated');
        });
      } catch (e) {
        customSnackBar(msg: 'Error Setting Wallpaper');
        customLoading(false);
      }
    }
  }

  Future<void> shareImage(String url) async {
    customLoading(true);
    XFile fileForShare = await fileFromImageUrl(url);

    Share.shareXFiles([fileForShare]);
    customLoading(false);
  }

  fileFromImageUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    final documentDirectory = await getApplicationDocumentsDirectory();
    String fileName = DateTime.now().toString();
    final file = File("${documentDirectory.path}$fileName.png");
    file.writeAsBytesSync(response.bodyBytes);
    return XFile(file.path);
  }

  Future<void> downloadImage(String imageUrl) async {
    try {
      customLoading(true);
      await GallerySaver.saveImage(imageUrl);
      customLoading(false);
      customSnackBar(msg: 'Image downloaded in Picture folder');
    } catch (e) {
      customSnackBar(msg: 'Error in download');
    }
  }
}
