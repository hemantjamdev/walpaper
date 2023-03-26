
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxString catName = "Nature".obs;

  changeSelect(String categoryName) {
    catName.value = categoryName;
  }

  List<String> categories = [
    'Nature',
    'Landscapes',
    'Wildlife',
    'Portraits',
    'Architecture',
    'Food',
    'Travel',
    'Fashion',
    'Black and white',
    'Sports',
    'Street',
    'Abstract',
    'Macro',
    'Documentary',
    'Night',
    'Family',
    'Events',
    'Cityscape',
    'Underwater',
    'Bike'
  ];

  RxList<String> categoryList = <String>[].obs;

  getCategory() {
    for (var element in categories) {
      categoryList.add('https://source.unsplash.com/featured/?$element');
    }
  }
}
