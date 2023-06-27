import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key,
    required this.dSize,
    required this.imgUrl,
  });

  final String imgUrl;
  final Size dSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                blurRadius: 0.8,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ]),
      height: dSize.height * 12,
      width: dSize.width * 0.28,
      child: CachedNetworkImage(
        imageUrl: imgUrl,
      ),
    );
  }
}
