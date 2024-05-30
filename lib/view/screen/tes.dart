import 'package:flutter/material.dart';
import 'package:jobs/view/fade_animation.dart';

class ASDF extends StatelessWidget {
  const ASDF({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FadeAnimation(
                 Container(
                  width: 200,
                  height: 24,
                  color: Colors.blue,
                ),
                1.5),
            FadeAnimation(
                 Container(
                  width: 100,
                  height: 24,
                  color: Colors.red,
                ),
             3),
            FadeAnimation(
             Container(
                  width: 300,
                  height: 24,
                  color: Colors.black,
                ),
                 9),
          ],
        ),
      ),
    );
  }
}
