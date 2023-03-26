import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/wallpaper/wallpaper_model.dart';
import 'package:http/http.dart' as http;

class WallpaperListController extends GetxController {
  ImageModel wallpaperData = ImageModel();
  RxList<Photos> imageList = <Photos>[].obs;

  getWallpaperList(String? value, [int? page = 1]) async {
    const API_KEY = '563492ad6f91700001000001e386ced37ce24f0bba8e9db72a117295';

    try {
      String url =
          "https://api.pexels.com/v1/search?query=$value&page=$page&per_page=20";
      //'https://api.pexels.com/v1/curated?page=$currentPage&per_page=$perPage'),

      http.Response res =
          await http.get(Uri.parse(url), headers: {'Authorization': API_KEY});
      if (res.statusCode == 200) {
        wallpaperData = ImageModel.fromJson(jsonDecode(res.body));
        imageList.value = wallpaperData.photos!;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
