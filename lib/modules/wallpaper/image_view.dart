import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper/modules/wallpaper/image_view_provider.dart';
import 'package:wallpaper/utils/permission_handler.dart';
import 'package:wallpaper/widgets/custon_toast.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/wallpaper_grid.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;

  ImageView({required this.imageUrl});

  final controller = ImageViewController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            InteractiveViewer(child: WallpaperGrid(url: imageUrl)),
            Obx(
              () => Container(
                color: Colors.black
                    .withOpacity(controller.isShowingLoading.value ? 0.5 : 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: controller.isShowingLoading.value
                          ? Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Center(child: LinearProgressIndicator()),
                            )
                          : Container(),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomIcon(
                            icon: Icon(Icons.share),
                            onTap: () => controller.shareImage(imageUrl),
                          ),
                          CustomIcon(
                              icon: Icon(Icons.file_download),
                              onTap: () async {
                                if (await Permissions.getPermission()) {
                                  controller.downloadImage(imageUrl);
                                } else {
                                  customSnackBar(
                                      msg:
                                          "permission is required for download");
                                }
                              }),
                          CustomIcon(
                              icon: Icon(Icons.wallpaper),
                              onTap: () async {
                                dynamic location = "";
                                showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ListTile(
                                                  title:
                                                      Text('Set as homescreen'),
                                                  onTap: () {
                                                    location =
                                                        WallpaperManagerFlutter
                                                            .HOME_SCREEN;
                                                    Get.back();
                                                  },
                                                ),
                                                ListTile(
                                                  title:
                                                      Text('Set as lockscreen'),
                                                  onTap: () {
                                                    location =
                                                        WallpaperManagerFlutter
                                                            .LOCK_SCREEN;
                                                    Get.back();
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text('Set as both'),
                                                  onTap: () {
                                                    location =
                                                        WallpaperManagerFlutter
                                                            .BOTH_SCREENS;
                                                    Get.back();
                                                  },
                                                )
                                              ],
                                            ),
                                          );
                                        })
                                    .then((value) => controller.setWallpaper(
                                        imageUrl, location));

                              }),
                          CustomIcon(
                            icon: Icon(Icons.favorite),
                            onTap: () {
                              // controller.showLoading();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
