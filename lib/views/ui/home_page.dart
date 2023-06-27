import 'package:flutter/material.dart';
import 'package:mini_ecom/models/sneaker_model.dart';
import 'package:mini_ecom/services/helper.dart';
import 'package:mini_ecom/views/shared/app_style.dart';
import 'package:mini_ecom/views/shared/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
              child: Container(
                padding: EdgeInsets.only(left: 8, bottom: 15),
                width: dSize.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sports Shoes",
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
                        unselectedLabelColor: Colors.grey.withOpacity(0.5),
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
                  HomeWidget(male: _male),
                  HomeWidget(male: _female),
                  HomeWidget(male: _kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
