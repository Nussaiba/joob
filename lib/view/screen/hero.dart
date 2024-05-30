import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/view/screen/opportunity.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.to(OpportunityPage());
          },
          child: Card( 


            elevation: 12,
            child: Hero(
              tag: 'imageHero',
              child: Image.asset(
                AppImageAsset.logo,
                width: 100.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: Image.asset(AppImageAsset.logo),
        ),
      ),
    );
  }
}
