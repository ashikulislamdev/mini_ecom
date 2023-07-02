import 'package:flutter/material.dart';
import 'package:mini_ecom/views/shared/app_style.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn(
      {super.key, this.onPress, required this.btnColor, required this.label});
  final Function()? onPress;
  final Color btnColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: btnColor,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child: Center(
          child: Text(
            label,
            style: appStyle(20, btnColor, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
