import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/modules/wallpaper/wallpaper_model.dart';

class CategoryController extends GetxController {
  CategoryController() {
    getCategory();
  }

  List<String> categories = [
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
    'Nature',
    'Cityscape',
    'Underwater',
    'Aerial'
  ];

  RxList<String> categoryList = <String>[].obs;

  getCategory() {
    for (var element in categories) {
      categoryList.add('https://source.unsplash.com/featured/?$element');
    }
  }
}
