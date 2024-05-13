import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'Hey Ali, \n '),
                TextSpan(
                    text: 'Looking for job?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ])),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.search,
                            size: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search job, companies',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: AppColor.grey),
                          ),
                          Spacer(),
                          Icon(
                            Icons.filter,
                            size: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(AppImageAsset.logo),
                  ),
                ],
              ),
            ),
            Container(
              height: 25,
              width: 80,
              margin: EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                color: AppColor.pink,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Text('Singaeeee',
                      style: TextStyle(fontSize: 18, color: AppColor.white)),
                  Spacer(),
                  Icon(
                    Icons.close_rounded,
                    size: 35,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Popular Job',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              'View All',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            
                          ],
                        ),
                  
                  
                      ),
                  
                  
                  Container(

                    height: 175,
                    child: ListView(
                      
                    ),
                  )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
