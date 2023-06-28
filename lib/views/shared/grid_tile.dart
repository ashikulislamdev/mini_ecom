import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecom/views/shared/app_style.dart';

class CustomGridTiel extends StatefulWidget {
  const CustomGridTiel(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});
  final String name;
  final String price;
  final String imageUrl;
  @override
  State<CustomGridTiel> createState() => _GridTileState();
}

class _GridTileState extends State<CustomGridTiel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.imageUrl,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              height: 75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: appStyleWithHt(20, Colors.black, FontWeight.w700, 1),
                  ),
                  Text(
                    widget.price,
                    style: appStyleWithHt(20, Colors.black, FontWeight.w400, 1),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
