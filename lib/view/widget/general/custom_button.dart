import 'package:flutter/material.dart';

class OpportunityButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const OpportunityButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child:  Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
