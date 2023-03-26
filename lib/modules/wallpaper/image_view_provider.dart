import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:wallpaper/widgets/custon_toast.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ImageViewController extends GetxController {
  RxBool isShowingLoading = false.obs;
  XFile? downloadedImage;

  Future<void> setWallpaper(String imageUrl, location) async {
    var file = await DefaultCacheManager().getSingleFile(imageUrl);
    if (location != "" && location != null) {
      try {
        isShowingLoading.value = true;
        WallpaperManagerFlutter().setwallpaperfromFile(file, location);
        Timer(const Duration(seconds: 2), () {
          isShowingLoading.value = false;
          customSnackBar(msg: 'wallpaper updated');
        });
      } catch (e) {
        customSnackBar(msg: 'Error Setting Wallpaper');
        isShowingLoading.value = false;
      }
    }
  }

  Future<void> shareImage(String text) async {
    isShowingLoading.value = true;
    if (downloadedImage != null) {
      Share.shareXFiles([downloadedImage!]);
    } else {
      await downloadImage(text);
      Share.shareXFiles([downloadedImage!]);
    }
    isShowingLoading.value = false;
  }

  Future<void> downloadImage(String imageUrl) async {
    Directory? directory = await path_provider.getExternalStorageDirectory();
    if (directory!.existsSync()) {
      log("-------> directory exist<-------");
      try {
        await FileDownloader.downloadFile(
            url: imageUrl,
            onProgress: (String? fileName, double progress) {
              isShowingLoading.value = true;
            },
            onDownloadCompleted: (String path) {
              isShowingLoading.value = false;
            },
            onDownloadError: (String error) {
              isShowingLoading.value = false;
            });
      } catch (e) {
        customSnackBar(msg: 'Error in download');
      }
    } else {
      customSnackBar(msg: 'something went wrong while download');
    }
  }
}
