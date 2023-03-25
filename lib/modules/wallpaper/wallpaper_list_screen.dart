import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/wallpaper/category_provider.dart';
import 'package:wallpaper/modules/wallpaper/category_screen.dart';
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
    controller.getWallpaperList;
    super.initState();
  }

  /* void search(String arg) {
    controller.getWallpaperList(value: arg);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.getWallpaperList,
        ),
        appBar: AppBar(
          title: Text("Wallpapers"),
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
                          child: gridWidget(image.src!.original.toString()));
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget gridWidget(String url) {
  return CachedNetworkImage(
    fit: BoxFit.cover,
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    placeholder: (context, url) => loading(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

Widget loading() {
  return Shimmer(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[400]!],
      stops: [0.4, 0.5, 0.6],
    ),
    child: Container(
      color: Colors.white,
    ),
  );
}

class SearchBar extends StatefulWidget {
  final void Function(String)? onSearch;

  const SearchBar({Key? key, this.onSearch}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: InputDecoration(
        hintText: 'Search...',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            if (widget.onSearch != null) {
              widget.onSearch!(_textEditingController.text);
            }
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
