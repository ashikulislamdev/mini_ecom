import 'package:flutter/material.dart';
import 'package:mini_ecom/views/shared/app_style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile Page",
          style: appStyle(36, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
