import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/wallpaper/wallpaper_model.dart';
import 'package:http/http.dart' as http;

class WallpaperListController extends GetxController {
  ImageModel wallpaperData = ImageModel();
  RxList<Photos> imageList = <Photos>[].obs;

  getWallpaperList() async {
    const API_KEY = '563492ad6f91700001000001e386ced37ce24f0bba8e9db72a117295';

    try {
      String url =
          "https://api.pexels.com/v1/search?query=bike?per_page=10&page=1";
      http.Response res =
          await http.get(Uri.parse(url), headers: {'Authorization': API_KEY});
      if (res.statusCode == 200) {
        wallpaperData = ImageModel.fromJson(jsonDecode(res.body));
        imageList.value = wallpaperData.photos!;
       // log('----->> this is data---->${res.body}<<----');
      } else {
        log('----->> can not get data<<----');
      }
    } catch (e) {
      log('--error in catch--->> $e<<----');
    }
  }
}
