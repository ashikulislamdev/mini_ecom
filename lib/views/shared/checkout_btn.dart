import 'package:flutter/material.dart';
import 'package:mini_ecom/views/shared/app_style.dart';

class CheckOutBtn extends StatelessWidget {
  const CheckOutBtn({
    super.key,
    required this.btnLabel,
    this.onTap,
  });
  final String btnLabel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              btnLabel,
              style: appStyle(21, Colors.white, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
