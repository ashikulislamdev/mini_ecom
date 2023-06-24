import 'package:flutter/material.dart';
import 'package:mini_ecom/views/shared/app_style.dart';

class ProductCart extends StatefulWidget {
  const ProductCart(
      {super.key,
      required this.price,
      required this.category,
      required this.id,
      required this.name,
      required this.image});

  final String price;
  final String category;
  final String id;
  final String name;
  final String image;

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    bool selected = true;
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Container(
          width: dSize.width * 0.6,
          height: dSize.height,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.white,
                blurRadius: 0.6,
                spreadRadius: 1,
                offset: Offset(1, 1)),
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: null,
                        child: const Icon(Icons.favorite_rounded),
                      )),
                  Container(
                    height: dSize.height * 0.23,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: NetworkImage(widget.image))),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appStyleWithHt(
                          36, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Text(
                      widget.category,
                      style:
                          appStyleWithHt(18, Colors.grey, FontWeight.bold, 1.5),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: appStyle(30, Colors.black, FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          "Color",
                          style: appStyle(16, Colors.grey, FontWeight.w500),
                        ),
                        const SizedBox(width: 5),
                        ChoiceChip(
                          label: Text(""),
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
