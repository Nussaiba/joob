import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class ButtonGoToSignUp extends StatelessWidget {
  const ButtonGoToSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.praimaryColor,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      onPressed: () {},
      child: Text('Go to SignUp'),
    );
  }
}