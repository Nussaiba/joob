import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/apply_job/create_cv_controller.dart';
import 'package:jobs/core/constants/color.dart';

class titleItemCv extends StatelessWidget {
  titleItemCv({super.key, required this.nameitem, required this.onPressed, required this.icon});
  final String nameitem;
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(nameitem,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color:AppColor.grey,
                  height: 45,
                  width: 45,
                  child: Icon(icon, size: 28, color : AppColor.white))),
              ElevatedButton(
                  onPressed: onPressed, child: Text("Add $nameitem")),
            ],
          ),
      
        ],
      ),
    );
  }
}
