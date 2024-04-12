import 'package:flutter/material.dart';
import 'package:flutter_image_search/data/model/photo.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.tags),
      ),
      body: Hero(
        tag: photo.id,
        child: Image.network(
          photo.largeImageUrl,
        ),
      ),
    );
  }
}
