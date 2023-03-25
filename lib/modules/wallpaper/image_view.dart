import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/wallpaper_grid.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;

  ImageView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       // appBar: MyAppBar(title: 'image'),
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            InteractiveViewer(child: WallpaperGrid(url: imageUrl)),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomIcon(icon: Icon(Icons.share)),
                      CustomIcon(icon: Icon(Icons.file_download)),
                      CustomIcon(icon: Icon(Icons.wallpaper)),
                      CustomIcon(icon: Icon(Icons.favorite)),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
