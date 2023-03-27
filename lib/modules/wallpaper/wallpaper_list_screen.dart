import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/wallpaper/category_screen.dart';
import 'package:wallpaper/modules/wallpaper/image_view.dart';
import 'package:wallpaper/modules/wallpaper/wallpaper_model.dart';
import 'package:wallpaper/modules/wallpaper/wallpepr_provider.dart';
import 'package:wallpaper/widgets/app_bar.dart';
import 'package:wallpaper/widgets/drawer.dart';

import '../../widgets/search_bar.dart';
import '../../widgets/wallpaper_grid.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WallpaperListScreen extends StatefulWidget {
  const WallpaperListScreen({Key? key}) : super(key: key);

  @override
  WallpaperListScreenState createState() => WallpaperListScreenState();
}

class WallpaperListScreenState extends State<WallpaperListScreen> {
  final controller = Get.put(WallpaperListController());

  @override
  void initState() {
    controller.getWallpaperList("Nature");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            appBarPadding: EdgeInsets.all(8),
            drawerIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            appBarColor: Colors.white,
            title: Text(
              "Wallpaper",
              style: const TextStyle(fontSize: 22),
            ),
          ),
          slider: CustomDrawer(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBar(onSearch: controller.getWallpaperList),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("popular categories"),
                  ),
                  CategoryList(
                    onCategorySearch: controller.getWallpaperList,
                  ),
                  Expanded(
                    child: MasonryGridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      crossAxisCount: 2,
                      itemCount: controller.imageList.length,
                      itemBuilder: (context, index) {
                        Photos image = controller.imageList[index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => ImageView(
                                imageUrl: image.src!.original.toString()));
                          },
                          child: Container(
                            height: image.height!.toDouble() / 30.toDouble(),
                            child: WallpaperGrid(
                              url: image.src!.tiny.toString(),
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
        ),
      ),
    );
  }
}
