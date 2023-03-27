import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/wallpaper/image_view_provider.dart';
import 'package:wallpaper/utils/permission_handler.dart';
import 'package:wallpaper/widgets/custon_snack.dart';
import 'package:wallpaper/widgets/loading.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

import '../../widgets/custom_icon.dart';
import '../../widgets/wallpaper_grid.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;

  ImageView({super.key, required this.imageUrl});

  final controller = ImageViewController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            InteractiveViewer(
              child: WallpaperGrid(url: imageUrl),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomIcon(
                        icon: const Icon(Icons.share),
                        onTap: () => controller.shareImage(imageUrl),
                      ),
                      CustomIcon(
                          icon: const Icon(Icons.file_download),
                          onTap: () async {
                            if (await Permissions.getPermission()) {
                              controller.downloadImage(imageUrl);
                            } else {
                              customSnackBar(
                                  msg: "permission is required for download");
                            }
                          }),
                      CustomIcon(
                          icon: const Icon(Icons.wallpaper),
                          onTap: () async {
                            dynamic location = "";
                            showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            title: const Text(
                                                'Set as home screen wallpaper'),
                                            onTap: () {
                                              location = WallpaperManagerFlutter
                                                  .HOME_SCREEN;
                                              Get.back();
                                            },
                                          ),
                                          ListTile(
                                            title: const Text(
                                                'Set as lockscreen wallpaper'),
                                            onTap: () {
                                              location = WallpaperManagerFlutter
                                                  .LOCK_SCREEN;
                                              Get.back();
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('Set as both '),
                                            onTap: () {
                                              location = WallpaperManagerFlutter
                                                  .BOTH_SCREENS;
                                              Get.back();
                                            },
                                          )
                                        ],
                                      );
                                    })
                                .then((value) => controller.setWallpaper(
                                    imageUrl, location));
                          }),
                      CustomIcon(
                        icon: const Icon(Icons.favorite),
                        onTap: () {
                          customSnackBar(msg: "this is testing dialog");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
