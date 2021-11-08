import 'package:flutter/material.dart';

class ImageWithLoading extends StatefulWidget {
  final String imageUrl;

  const ImageWithLoading({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _CustomImage createState() => _CustomImage();
}

class _CustomImage extends State<ImageWithLoading> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
