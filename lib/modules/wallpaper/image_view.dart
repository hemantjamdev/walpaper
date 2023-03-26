
import 'dart:developer';

import 'package:flutter/material.dart';
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Expanded(
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
                            icon: Icon(
                              Icons.file_download,
                            ),
                            onTap: () async {
                              if (await Permissions.getPermission()) {
                                controller.downloadImage(imageUrl);
                                log("------> permission given<-------");
                              } else {
                                customSnackBar(
                                    msg: "permission is required for download");
                              }
                            }),
                        CustomIcon(
                          icon: Icon(Icons.wallpaper),
                          onTap: () => controller.setWallpaper(
                            imageUrl,
                            WallpaperManagerFlutter.HOME_SCREEN,
                          ),
                        ),
                        CustomIcon(icon: Icon(Icons.favorite)),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
