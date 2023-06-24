import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecom/views/shared/app_style.dart';
import 'package:mini_ecom/views/shared/product_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: dSize.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: dSize.height * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(left: 8, bottom: 15),
                width: dSize.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sports Shows",
                      style: appStyleWithHt(
                          42, Colors.white, FontWeight.bold, 1.5),
                    ),
                    Text(
                      "Collection",
                      style: appStyleWithHt(
                          42, Colors.white, FontWeight.bold, 1.2),
                    ),
                    TabBar(
                        padding: EdgeInsets.zero,
                        indicatorColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.label,
                        controller: tabController,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                        unselectedLabelColor: Colors.grey.withOpacity(0.3),
                        tabs: const [
                          Tab(text: "Man Shoes"),
                          Tab(text: "Women Shoes"),
                          Tab(text: "Kids Shoes"),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: dSize.height * 0.265),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: TabBarView(controller: tabController, children: [
                  Column(
                    children: [
                      SizedBox(
                        height: dSize.height * 0.405,
                        child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const ProductCart(
                                price: "20.10",
                                category: "Lotto ",
                                id: "10",
                                name: "New feshion",
                                image:
                                    "https://d326fntlu7tb1e.cloudfront.net/uploads/76cfc4b8-5d8c-4213-96f9-b36cf4245c1d-F99739_a1.webp");
                          },
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Latest shoes",
                                  style: appStyle(
                                      24, Colors.black, FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Show all",
                                      style: appStyle(
                                          22, Colors.black, FontWeight.w500),
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
                        ],
                      ),
                      SizedBox(
                        height: dSize.height * 0.13,
                        child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
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
                                  imageUrl:
                                      "https://d326fntlu7tb1e.cloudfront.net/uploads/58282ea3-b815-4d26-9f4f-382aa62f67cf-HP5404_a1.webp",
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: dSize.height * 0.405,
                        color: Colors.amber,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: dSize.height * 0.405,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
