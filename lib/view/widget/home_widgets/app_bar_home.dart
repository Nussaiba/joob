
import 'package:flutter/material.dart';
import 'package:jobs/controller/general/side_bar_controller.dart';
import 'package:jobs/core/constants/color.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
   required  this.text,required this.controller,

  });
final String text;
  final SideBarController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.pink.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Jobs",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColor.praimaryColor,
                    fontFamily: "Pacifico",
                    // fontFamily : "Cairo" ,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  width: 55,
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                      color: AppColor.praimaryColor,
                    ),
                    onPressed: () {

                     
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  width: 55,
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                      color: AppColor.praimaryColor,
                    ),
                    onPressed: () {
                      controller.toggleShow();
                    },
                  ),
                ),
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
             // "Find Your Dream Job",
             text,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w100,
                color: AppColor.praimaryColor,
                fontFamily: "Pacifico",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
