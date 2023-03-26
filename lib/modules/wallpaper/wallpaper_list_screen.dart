import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/wallpaper/category_provider.dart';
import 'package:wallpaper/modules/wallpaper/category_screen.dart';
import 'package:wallpaper/modules/wallpaper/image_view.dart';
import 'package:wallpaper/modules/wallpaper/wallpaper_model.dart';
import 'package:wallpaper/modules/wallpaper/wallpepr_provider.dart';
import 'package:wallpaper/widgets/app_bar.dart';

import '../../widgets/search_bar.dart';
import '../../widgets/wallpaper_grid.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WallpaperListScreen extends StatefulWidget {
  const WallpaperListScreen({Key? key}) : super(key: key);

  @override
  _WallpaperListScreenState createState() => _WallpaperListScreenState();
}

class _WallpaperListScreenState extends State<WallpaperListScreen> {
  final controller = Get.put(WallpaperListController());

  @override
  void initState() {
    controller.getWallpaperList("Nature");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      //floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: MyAppBar(
        title: 'wallpaper'
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
              CategoryList(
                onCategorySearch: controller.getWallpaperList,
              ),
              Expanded(
                child: MasonryGridView.count(
                  addSemanticIndexes: true,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  crossAxisCount: 2,
                  itemCount: controller.imageList.length,
                  /*  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),*/
                  itemBuilder: (context, index) {
                    Photos image = controller.imageList[index];
                    return Container(
                      height: image.height! / 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => ImageView(
                              imageUrl: image.src!.original.toString()));
                        },
                        child: WallpaperGrid(
                          // height:
                          url: image.src!.medium.toString(),
                        ),
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
