import 'package:cargo_packaging/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key, required this.titleText});

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColor.textLight,
        fontSize: 18.0,
      ),
    );
  }
}
