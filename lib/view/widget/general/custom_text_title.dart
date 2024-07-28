import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomTextTitle extends StatelessWidget {
  final String text;
  const CustomTextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        color: AppColor.TextColor(),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
