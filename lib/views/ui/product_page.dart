import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mini_ecom/controllers/cart_provider.dart';
import 'package:mini_ecom/controllers/favorite_provider.dart';
import 'package:mini_ecom/models/sneaker_model.dart';
import 'package:mini_ecom/views/shared/app_style.dart';
import 'package:mini_ecom/views/shared/checkout_btn.dart';
import 'package:mini_ecom/views/ui/favorite_page.dart';
import 'package:mini_ecom/controllers/producut_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id, required this.category});

  final String id;
  final String category;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductNotifier>(context);
    productProvider.getShoe(widget.category, widget.id);

    var cartProvider = Provider.of<CartProvider>(context);
    var favoriteProvider = Provider.of<FavoriteNotifire>(context, listen: true);
    favoriteProvider.getFavorite();

    return Scaffold(
      body: FutureBuilder<SneakersModel>(
          future: productProvider.sneakers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Eroor is ${snapshot.error}");
            } else {
              final sneaker = snapshot.data;
              return Consumer<ProductNotifier>(
                builder: (context, productNotifier, child) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        leadingWidth: 0,
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  productNotifier.shoeSize.clear();
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.more_horiz,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        pinned: true,
                        snap: false,
                        floating: true,
                        backgroundColor: Colors.transparent,
                        expandedHeight: MediaQuery.of(context).size.height,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width,
                                child: PageView.builder(
                                  itemCount: sneaker!.imageUrl.length,
                                  scrollDirection: Axis.horizontal,
                                  controller: pageController,
                                  onPageChanged: (page) {
                                    productNotifier.activePage = page;
                                  },
                                  itemBuilder: (context, int index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.39,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.grey.shade300,
                                          child: CachedNetworkImage(
                                            imageUrl: sneaker.imageUrl[index],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Positioned(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          right: 16,
                                          child: Consumer<FavoriteNotifire>(
                                              builder: (context,
                                                  favoriteNotifire, child) {
                                            return GestureDetector(
                                              onTap: () {
                                                if (favoriteNotifire.ids
                                                    .contains(widget.id)) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const FavoritePage()));
                                                } else {
                                                  favoriteNotifire.createFav({
                                                    'id': sneaker.id,
                                                    'name': sneaker.name,
                                                    'category':
                                                        sneaker.category,
                                                    'price': sneaker.price,
                                                    'imageUrl':
                                                        sneaker.imageUrl[0]
                                                  });
                                                }
                                                setState(() {});
                                              },
                                              child: favoriteNotifire.ids
                                                      .contains(sneaker.id)
                                                  ? const Icon(Icons.favorite,
                                                      size: 30,
                                                      color: Colors.black)
                                                  : const Icon(
                                                      Icons.favorite_outline,
                                                      size: 30,
                                                      color: Colors.black),
                                            );
                                          }),
                                        ),
                                        Positioned(
                                            right: 0,
                                            left: 0,
                                            bottom: 0,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List<Widget>.generate(
                                                  sneaker.imageUrl.length,
                                                  (index) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 4,
                                                        ),
                                                        child: CircleAvatar(
                                                            radius: 5,
                                                            backgroundColor:
                                                                productNotifier
                                                                            .activePage !=
                                                                        index
                                                                    ? Colors
                                                                        .grey
                                                                    : Colors
                                                                        .black),
                                                      )),
                                            )),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 30,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.645,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ReuseableText(
                                            text: sneaker.name,
                                            style: appStyle(40, Colors.black,
                                                FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              ReuseableText(
                                                text: sneaker.category,
                                                style: appStyle(20, Colors.grey,
                                                    FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              RatingBar.builder(
                                                initialRating: 4,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 25,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 1),
                                                itemBuilder: (context, index) =>
                                                    const Icon(Icons.star),
                                                onRatingUpdate: (rating) {},
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ReuseableText(
                                                text: "\$${sneaker.price}",
                                                style: appStyle(
                                                    26,
                                                    Colors.black,
                                                    FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Colors",
                                                    style: appStyle(
                                                        20,
                                                        Colors.black,
                                                        FontWeight.w600),
                                                  ),
                                                  const SizedBox(width: 6),
                                                  const CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor:
                                                          Colors.black),
                                                  const SizedBox(width: 4),
                                                  const CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor:
                                                          Colors.amber),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Select size",
                                                    style: appStyle(
                                                        20,
                                                        Colors.black,
                                                        FontWeight.w700),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "View size guide",
                                                    style: appStyle(
                                                        20,
                                                        Colors.grey,
                                                        FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              SizedBox(
                                                height: 40,
                                                child: ListView.builder(
                                                  itemCount: productNotifier
                                                      .shoeSize.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  padding: EdgeInsets.zero,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final sizes =
                                                        productNotifier
                                                            .shoeSize[index];
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8),
                                                      child: ChoiceChip(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        60),
                                                            side: const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                                style:
                                                                    BorderStyle
                                                                        .solid)),
                                                        disabledColor:
                                                            Colors.white,
                                                        label: Text(
                                                          sizes['size'],
                                                          style: appStyle(
                                                              18,
                                                              Colors.black,
                                                              FontWeight.w500),
                                                        ),
                                                        labelStyle: appStyle(
                                                            18,
                                                            sizes['isSelected']
                                                                ? Colors.white
                                                                : Colors.black,
                                                            FontWeight.w500),
                                                        selected:
                                                            sizes['isSelected'],
                                                        onSelected: (newState) {
                                                          if (productNotifier
                                                              .sizes
                                                              .contains(sizes[
                                                                  'size'])) {
                                                            productNotifier
                                                                .sizes
                                                                .remove(sizes[
                                                                    'size']);
                                                          } else {
                                                            productNotifier
                                                                .sizes
                                                                .add(sizes[
                                                                    'size']);
                                                          }
                                                          print(productNotifier
                                                              .sizes);

                                                          productNotifier
                                                              .toggleCheck(
                                                                  index);
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          const Divider(
                                              indent: 10,
                                              endIndent: 10,
                                              color: Colors.black),
                                          const SizedBox(height: 10),
                                          Text(
                                            sneaker.description,
                                            textAlign: TextAlign.justify,
                                            maxLines: 4,
                                            style: appStyle(14, Colors.black,
                                                FontWeight.normal),
                                          ),
                                          const SizedBox(height: 10),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12),
                                              child: CheckOutBtn(
                                                onTap: () async {
                                                  cartProvider.createCart({
                                                    'id': sneaker.id,
                                                    'name': sneaker.name,
                                                    'category':
                                                        sneaker.category,
                                                    'sizes':
                                                        productNotifier.sizes,
                                                    'price': sneaker.price,
                                                    'imageUrl':
                                                        sneaker.imageUrl[0],
                                                    'qty': 1,
                                                  });
                                                  //productNotifier.sizes.clear();
                                                  //print(productNotifier.sizes);
                                                  Navigator.pop(context);
                                                },
                                                btnLabel: 'Add to Cart',
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            }
          }),
    );
  }
}
