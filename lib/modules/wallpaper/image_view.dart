import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../widgets/app_bar.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;

  ImageView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  MyAppBar(
        widget: Hero(tag: 'appbar_title',child: Text('image'),),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Hero(
            tag: "image",
            child: PhotoView(
              imageProvider: NetworkImage(imageUrl),
              backgroundDecoration: BoxDecoration(color: Colors.black),
              loadingBuilder: (context, event) =>
                  Center(child: CircularProgressIndicator()),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.share),
                    color: Colors.white,
                    onPressed: () {
                      // Handle share button press
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.file_download),
                    color: Colors.white,
                    onPressed: () {
                      // Handle download button press
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.wallpaper),
                    color: Colors.white,
                    onPressed: () {
                      // Handle set as wallpaper button press
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    color: Colors.white,
                    onPressed: () {
                      // Handle add to favorites button press
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
