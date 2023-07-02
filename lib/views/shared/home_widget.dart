import 'package:flutter/material.dart';
import 'package:mini_ecom/models/sneaker_model.dart';
import 'package:mini_ecom/views/shared/app_style.dart';
import 'package:mini_ecom/views/shared/new_shoes.dart';
import 'package:mini_ecom/views/shared/product_cart.dart';
import 'package:mini_ecom/views/ui/product_by_cat.dart';
import 'package:mini_ecom/views/ui/product_page.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<SneakersModel>> male,
    required this.tabIndex,
  }) : _male = male;

  final Future<List<SneakersModel>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: dSize.height * 0.405,
          child: FutureBuilder(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Eroor is ${snapshot.error}");
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductPage(
                                id: shoe.id, category: shoe.category)));
                      },
                      child: ProductCart(
                          price: "\$${shoe.price}",
                          category: shoe.category,
                          id: shoe.id,
                          name: shoe.name,
                          image: shoe.imageUrl[0]),
                    );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductByCat(
                            tabIndex: tabIndex,
                          )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest shoes",
                      style: appStyle(24, Colors.black, FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          "Show all",
                          style: appStyle(22, Colors.black, FontWeight.w500),
                        ),
                        const Icon(
                          Icons.arrow_right,
                          size: 36,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: dSize.height * 0.13,
          child: FutureBuilder<List<SneakersModel>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Eroor is ${snapshot.error}");
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: NewShoes(dSize: dSize, imgUrl: shoe.imageUrl[1]),
                    );
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}
