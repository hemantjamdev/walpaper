import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:wallpaper/widgets/custon_toast.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class ImageViewController extends GetxController {
  Future<void> setWallpaper(String imageUrl, location) async {
    var file = await DefaultCacheManager().getSingleFile(imageUrl);
    try {
      Get.dialog(Container(color: Colors.white.withOpacity(0.2)),
          barrierDismissible: false);

      WallpaperManagerFlutter().setwallpaperfromFile(file, location);
      Timer(Duration(seconds: 2), () {
        Get.back();
        customSnackBar(msg: 'wallpaper updated');
      });
    } catch (e) {
      customSnackBar(msg: 'Error Setting Wallpaper');
    }
  }

  Future<void> shareImage(String text) async {
    await Share.share(text);
  }

  Future<void> downloadImage(String imageUrl) async {
    Directory? directory = await path_provider.getExternalStorageDirectory();
    if (directory!.existsSync()) {
      await FileDownloader.downloadFile(
          url: imageUrl,
          onProgress: (String? fileName, double progress) {},
          onDownloadCompleted: (String path) {},
          onDownloadError: (String error) {});
    } else {
      FileDownloader.downloadFile(
          url: imageUrl,
          onProgress: (String? fileName, double progress) {},
          onDownloadCompleted: (String path) {},
          onDownloadError: (String error) {});
    }
  }
}

void showLoading() {
  LiquidCircularProgressIndicator(
    value: 0.25,
    // Defaults to 0.5.
    valueColor: AlwaysStoppedAnimation(Colors.pink),
    // Defaults to the current Theme's accentColor.
    backgroundColor: Colors.white,
    // Defaults to the current Theme's backgroundColor.
    borderColor: Colors.red,
    borderWidth: 5.0,
    direction: Axis.horizontal,
    // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
    center: Text("Loading..."),
  );
}
