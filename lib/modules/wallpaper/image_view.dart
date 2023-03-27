import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallpaper/local_storage/local_storage.dart';
import 'package:wallpaper/main.dart';
import 'package:wallpaper/modules/wallpaper/image_view_provider.dart';
import 'package:wallpaper/utils/permission_handler.dart';
import 'package:wallpaper/widgets/custon_snack.dart';
import 'package:wallpaper/widgets/loading.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

import '../../widgets/custom_icon.dart';
import '../../widgets/wallpaper_grid.dart';

class ImageView extends StatefulWidget {
  final String imageUrl;

  const ImageView({super.key, required this.imageUrl});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final controller = ImageViewController();
  bool isFav = false;
  List<String> urls = [];

  void getUrlList() async {
    Box<FavModel> box = await Hive.openBox<FavModel>("favorites");
    if (box.values.isNotEmpty) {
      box.values.forEach((FavModel element) {
        urls.add(element.imageUrl.toString());
      });
    }
  }

  @override
  void initState() {
    getUrlList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUrlList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            InteractiveViewer(
              child: WallpaperGrid(url: widget.imageUrl),
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
                        onTap: () => controller.shareImage(widget.imageUrl),
                      ),
                      CustomIcon(
                          icon: const Icon(Icons.file_download),
                          onTap: () async {
                            if (await Permissions.getPermission()) {
                              controller.downloadImage(widget.imageUrl);
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
                                            title: Center(
                                              child: const Text(
                                                  'Set as home screen wallpaper'),
                                            ),
                                            onTap: () {
                                              location = WallpaperManagerFlutter
                                                  .HOME_SCREEN;
                                              Get.back();
                                            },
                                          ),
                                          ListTile(
                                            title: Center(
                                              child: const Text(
                                                  'Set as lockscreen wallpaper'),
                                            ),
                                            onTap: () {
                                              location = WallpaperManagerFlutter
                                                  .LOCK_SCREEN;
                                              Get.back();
                                            },
                                          ),
                                          ListTile(
                                            title: Center(
                                                child:
                                                    const Text('Set as both ')),
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
                                    widget.imageUrl, location));
                          }),
                      CustomIcon(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        onTap: ()async {
                          //setState(()  {
                            isFav = !isFav;
                            if (isFav&&!urls.contains(widget.imageUrl)) {
                              Box box =
                                  await Hive.openBox<FavModel>("favorites");
                              String uid = uuid.v1();
                              FavModel favModel = FavModel(
                                  uid, widget.imageUrl, DateTime.now());
                              box.put(uid, favModel);
                              customSnackBar(msg: "Added to favorites");
                            }else{
                              customSnackBar(msg: "Already added to favorites");
                            }
                            setState(() {

                            });
                          //});
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
