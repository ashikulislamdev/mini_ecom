import 'package:flutter/material.dart';
import 'package:mini_ecom/views/shared/app_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Search Page",
          style: appStyle(36, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
