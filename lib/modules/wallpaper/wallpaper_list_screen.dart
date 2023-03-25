import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/wallpaper/wallpaper_model.dart';
import 'package:wallpaper/modules/wallpaper/wallpepr_provider.dart';

class WallpaperListScreen extends StatefulWidget {
  const WallpaperListScreen({Key? key}) : super(key: key);

  @override
  _WallpaperListScreenState createState() => _WallpaperListScreenState();
}

class _WallpaperListScreenState extends State<WallpaperListScreen> {
  final controller = Get.put(WallpaperListController());

  @override
  void initState() {
    controller.getWallpaperList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wallpapers"),
        ),
        body: Obx(
          () => GridView.builder(
            itemCount: controller.wallpaperList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              ImageModel image = controller.wallpaperList[index];
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Image.network(
                    image.photos![index].url.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ));
  }
}
