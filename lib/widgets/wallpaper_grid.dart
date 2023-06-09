import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WallpaperGrid extends StatelessWidget {
  final String url;
  const WallpaperGrid({Key? key, required this.url, }) : super(key: key);

  Widget loading() {
    return Shimmer(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[400]!],
        stops: const [0.4, 0.5, 0.6],
      ),
      child: Container(
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => loading(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
