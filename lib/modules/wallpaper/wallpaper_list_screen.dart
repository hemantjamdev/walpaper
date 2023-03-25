import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/wallpaper/category_provider.dart';
import 'package:wallpaper/modules/wallpaper/category_screen.dart';
import 'package:wallpaper/modules/wallpaper/wallpaper_model.dart';
import 'package:wallpaper/modules/wallpaper/wallpepr_provider.dart';
import 'package:wallpaper/widgets/app_bar.dart';

import '../../widgets/search_bar.dart';
import '../../widgets/wallpaper_grid.dart';

class WallpaperListScreen extends StatefulWidget {
  const WallpaperListScreen({Key? key}) : super(key: key);

  @override
  _WallpaperListScreenState createState() => _WallpaperListScreenState();
}

class _WallpaperListScreenState extends State<WallpaperListScreen> {
  final controller = Get.put(WallpaperListController());

  @override
  void initState() {
    controller.getWallpaperList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getWallpaperList,
      ),
      appBar: MyAppBar(
        widget: Hero(
          tag: 'appbar_title',
          child: Text('wallpapers'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(onSearch: controller.getWallpaperList),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("popular categories"),
              ),
              CategoryList(),
              Expanded(
                child: GridView.builder(
                  itemCount: controller.imageList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    Photos image = controller.imageList[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: WallpaperGrid(
                        url: image.src!.original.toString(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
