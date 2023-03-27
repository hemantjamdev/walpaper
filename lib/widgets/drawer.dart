import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallpaper/local_storage/local_storage.dart';
import 'package:wallpaper/widgets/wallpaper_grid.dart';

import '../modules/wallpaper/image_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/f1.jpg'), fit: BoxFit.cover),
            ),
          ),
          Expanded(
              child: ValueListenableBuilder(
                  valueListenable: Hive.box<FavModel>("favorites").listenable(),
                  builder: (context, Box<FavModel> box, widget) {
                    return box.values.isEmpty
                        ? Center(child: Text("your favorites will be here !"))
                        : MasonryGridView.count(
                            shrinkWrap: true,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                            crossAxisCount: 2,
                            itemCount: box.length,
                            itemBuilder: (context, index) {
                              List<FavModel> urls = [];
                              box.values.forEach((element) {
                                urls.add(element);
                              });
                              return InkWell(
                                onTap: () {
                                  Get.to(() => ImageView(
                                      imageUrl: urls[index].imageUrl!));
                                },
                                child: Container(
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      WallpaperGrid(
                                          url: urls[index].imageUrl.toString()),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () async {
                                                Box boxx = await Hive.openBox<
                                                    FavModel>("favorites");
                                                await boxx
                                                    .delete(urls[index].uid);
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                  }))
        ],
      ),
    );
  }
}
