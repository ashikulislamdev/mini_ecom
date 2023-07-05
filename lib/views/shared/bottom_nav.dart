import 'package:flutter/material.dart';
import 'package:mini_ecom/controllers/main_screen_provider.dart';
import 'package:mini_ecom/views/shared/bottom_nav_widget.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 0;
                  },
                  iconData: mainScreenNotifier.pageIndex == 0
                      ? Icons.home
                      : Icons.home_outlined,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 1;
                  },
                  iconData: mainScreenNotifier.pageIndex == 1
                      ? Icons.search
                      : Icons.search_outlined,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 2;
                  },
                  iconData: mainScreenNotifier.pageIndex == 2
                      ? Icons.favorite
                      : Icons.favorite_outline,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 3;
                  },
                  iconData: mainScreenNotifier.pageIndex == 3
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 4;
                  },
                  iconData: mainScreenNotifier.pageIndex == 4
                      ? Icons.person
                      : Icons.person_outline,
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
