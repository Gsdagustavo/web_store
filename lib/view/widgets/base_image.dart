import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BaseImage extends StatelessWidget {
  const BaseImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) {
        return Center(child: CircularProgressIndicator());
      },

      errorWidget: (context, url, error) {
        return const Center(child: Icon(Icons.image_not_supported));
      },
    );
  }
}
