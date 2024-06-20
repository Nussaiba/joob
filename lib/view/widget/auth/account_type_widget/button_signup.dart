import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class ButtonSignUp extends StatelessWidget {
  final void Function()? onPressed;
  const ButtonSignUp({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.pink,
        //padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      onPressed: onPressed,
      child: const Text('SignUp'),
    );
  }
}
