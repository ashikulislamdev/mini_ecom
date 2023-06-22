import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    this.onTap,
    this.iconData,
  });
  final Function()? onTap;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 36,
          width: 36,
          child: Icon(
            iconData,
            size: 30,
            color: Colors.white,
          ),
        ));
  }
}
