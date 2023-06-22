import 'package:flutter/material.dart';
import 'package:mini_ecom/views/shared/app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home Page",
          style: appStyle(36, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
