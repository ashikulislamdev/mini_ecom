import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mini_ecom/models/constants.dart';
import 'package:mini_ecom/views/shared/app_style.dart';
import 'package:mini_ecom/views/ui/main_screen.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _favBox = Hive.box('fav_box');

  deleteFav(int key) async {
    await _favBox.delete(key);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> favoriteList = [];
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        'key': key,
        'id': item['id'],
        'name': item['name'],
        'category': item['category'],
        'price': item['price'],
        'imageUrl': item['imageUrl']
      };
    }).toList();
    favoriteList = favData.reversed.toList();

    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "My favorite list",
                    style: appStyle(40, Colors.white, FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: favoriteList.length,
                  padding: const EdgeInsets.only(top: 100),
                  itemBuilder: (context, index) {
                    final shoe = favoriteList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 0.3,
                                spreadRadius: 5,
                                offset: Offset(0, 1)),
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: CachedNetworkImage(
                                  imageUrl: shoe['imageUrl'],
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shoe['name'],
                                      style: appStyle(
                                          16, Colors.black, FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      shoe['category'],
                                      style: appStyle(
                                          14, Colors.black, FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "\$${shoe['price']}",
                                      style: appStyle(
                                          16, Colors.black, FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: GestureDetector(
                                  onTap: () {
                                    deleteFav(shoe['key']);
                                    ids.removeWhere(
                                        (element) => element == shoe['id']);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
                                  },
                                  child: const Icon(
                                    Icons.cancel_outlined,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
