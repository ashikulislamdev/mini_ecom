import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecom/controllers/favorite_provider.dart';
import 'package:mini_ecom/controllers/producut_provider.dart';
import 'package:mini_ecom/views/shared/app_style.dart';
import 'package:mini_ecom/views/shared/home_widget.dart';
import 'package:provider/provider.dart';

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

    var productProvider = Provider.of<ProductNotifier>(context);
    productProvider.getMale();
    productProvider.getFemale();
    productProvider.getKids();

    var favoriteProvider = Provider.of<FavoriteNotifire>(context);
    favoriteProvider.getFavorite();

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: dSize.height,
        width: dSize.width,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 45.h, 0, 0),
              height: 325.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(left: 8.w, bottom: 15.h),
                width: dSize.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReuseableText(
                      text: "Sports Shoes",
                      style: appStyleWithHt(
                          42, Colors.white, FontWeight.bold, 1.5),
                    ),
                    ReuseableText(
                      text: "Collection",
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
              padding: EdgeInsets.only(top: 203.h),
              child: Container(
                padding: EdgeInsets.only(left: 12.w),
                child: TabBarView(controller: tabController, children: [
                  HomeWidget(male: productProvider.male, tabIndex: 0),
                  HomeWidget(male: productProvider.female, tabIndex: 1),
                  HomeWidget(male: productProvider.kids, tabIndex: 2),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
