import 'package:flutter/material.dart';
import 'package:mini_ecom/models/sneaker_model.dart';
import 'package:mini_ecom/services/helper.dart';
import 'package:mini_ecom/views/shared/app_style.dart';
import 'package:mini_ecom/views/shared/by_cat_widget.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key});

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 3, vsync: this);

  late Future<List<SneakersModel>> _male;
  late Future<List<SneakersModel>> _female;
  late Future<List<SneakersModel>> _kids;

  void getMale() {
    _male = Helper().getMailSneakers();
  }

  void getFemale() {
    _female = Helper().getFemailneakers();
  }

  void getKids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    getMale();
    getFemale();
    getKids();

    super.initState();
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.filter_list_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      )),
                  TabBar(
                      padding: EdgeInsets.zero,
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.5),
                      tabs: const [
                        Tab(text: "Man Shoes"),
                        Tab(text: "Women Shoes"),
                        Tab(text: "Kids Shoes"),
                      ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: dSize.height * 0.175,
                right: 12,
                left: 16,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(controller: tabController, children: [
                  ProductByCatWidget(male: _male, dSize: dSize),
                  ProductByCatWidget(male: _female, dSize: dSize),
                  ProductByCatWidget(male: _kids, dSize: dSize),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
