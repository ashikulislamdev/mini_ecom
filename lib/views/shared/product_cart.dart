import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mini_ecom/models/constants.dart';
import 'package:mini_ecom/views/shared/app_style.dart';
import 'package:mini_ecom/views/ui/favorite_page.dart';

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
  final _favBox = Hive.box('fav_box');

  Future<void> createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
    getFavorite();
  }

  getFavorite() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);

      return {'key': key, 'id': item['id']};
    }).toSet();

    favor = favData.toList();
    ids = favor.map((item) => item['id']).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                      onTap: () {
                        print("clicked");
                        if (ids.contains(widget.id)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FavoritePage()));
                        } else {
                          createFav({
                            'id': widget.id,
                            'name': widget.name,
                            'category': widget.category,
                            'price': widget.price,
                            'imageUrl': widget.image
                          });
                        }
                      },
                      child: ids.contains(widget.id)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_outline),
                    ),
                  ),
                  Container(
                    height: dSize.height * 0.23,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: NetworkImage(widget.image))),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appStyleWithHt(
                          32, Colors.black, FontWeight.bold, 1.1),
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
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: appStyle(28, Colors.black, FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          "Color",
                          style: appStyle(16, Colors.grey, FontWeight.w500),
                        ),
                        const SizedBox(width: 5),
                        ChoiceChip(
                          label: const Text(""),
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
