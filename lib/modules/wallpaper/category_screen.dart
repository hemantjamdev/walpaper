import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/wallpaper/category_provider.dart';

class CategoryList extends StatefulWidget {
  final void Function(String)? onCategorySearch;

  const CategoryList({required this.onCategorySearch, super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final controller = CategoryController();
@override
  void initState() {
    controller.getCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(border: Border()),
      height: 120.0,
      child: Card(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          widget.onCategorySearch!(controller.categories[index]);
                          controller.changeSelect(controller.categories[index]);
                        },
                        child: Obx(
                          () => CircleAvatar(
                            radius: controller.catName.value ==
                                    controller.categories[index]
                                ? 33
                                : 31,
                            backgroundColor: controller.catName.value ==
                                    controller.categories[index]
                                ? Colors.orange
                                : Colors.black,
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: CachedNetworkImageProvider(
                                  controller.categoryList[index].toString()),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        controller.categories[index],
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
