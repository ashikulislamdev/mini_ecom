import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:mini_ecom/views/shared/app_style.dart';
import 'package:mini_ecom/views/shared/checkout_btn.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final _cartBox = Hive.box('cart_box');

  @override
  Widget build(BuildContext context) {
    List<dynamic> cart = [];

    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      //print(item);
      return {
        "key": key,
        'id': item['id'],
        'name': item['name'],
        'category': item['category'],
        'price': item['price'],
        'imageUrl': item['imageUrl'],
        'qty': item['qty'],
        'sizes': item['sizes'],
      };
    }).toList();

    cart = cartData.reversed.toList();

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, size: 30, color: Colors.black),
                ),
                Text("My Cart",
                    style: appStyle(36, Colors.black, FontWeight.bold)),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    itemCount: cart.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final data = cart[index];

                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {},
                                    flex: 1,
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color(0xFF000000),
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ]),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade500,
                                        spreadRadius: 5,
                                        blurRadius: 0.3,
                                        offset: const Offset(0, 1)),
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: CachedNetworkImage(
                                          imageUrl: data['imageUrl'],
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['name'],
                                              style: appStyle(16, Colors.black,
                                                  FontWeight.bold),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              data['category'],
                                              style: appStyle(14, Colors.grey,
                                                  FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  data['price'],
                                                  style: appStyle(
                                                      18,
                                                      Colors.black,
                                                      FontWeight.bold),
                                                ),
                                                const SizedBox(width: 16),
                                                Text(
                                                  "Size",
                                                  style: appStyle(
                                                      16,
                                                      Colors.black,
                                                      FontWeight.w700),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  "${data['sizes']}",
                                                  style: appStyle(
                                                      18,
                                                      Colors.black,
                                                      FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  color: Colors.black,
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Text(data['qty'].toString()),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                    color: Colors.grey,
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CheckOutBtn(
                  btnLabel: "Procced to checkout",
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
