import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/wallpaper/category_provider.dart';

class CategoryList extends StatelessWidget {
  final void Function(String)? onCategorySearch;

  CategoryList({required this.onCategorySearch, super.key});

  final controller = CategoryController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border()),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
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
                          onCategorySearch!(controller.categories[index]);
                          controller.changeSelect(controller.categories[index]);
                        },
                        child: Obx(
                          () => CircleAvatar(
                            radius: controller.catName.value ==
                                    controller.categories[index]
                                ? 32
                                : 31,
                            backgroundColor: controller.catName.value ==
                                    controller.categories[index]
                                ? Colors.orange
                                : Colors.white,
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  controller.categoryList[index].toString()),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(controller.categories[index],
                          style: TextStyle(fontSize: 16.0)),
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
