import 'package:flutter/material.dart';
import 'package:mini_ecom/controllers/main_screen_provider.dart';
import 'package:mini_ecom/views/shared/bottom_nav.dart';
import 'package:mini_ecom/views/ui/cart_page.dart';
import 'package:mini_ecom/views/ui/favorite_page.dart';
import 'package:mini_ecom/views/ui/home_page.dart';
import 'package:mini_ecom/views/ui/profile_page.dart';
import 'package:mini_ecom/views/ui/search_page.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          body: pageList[mainScreenNotifier.pageIndex],
          backgroundColor: const Color(0xFFE2E2E2),
          bottomNavigationBar: const BottomNav(),
        );
      },
    );
  }
}
