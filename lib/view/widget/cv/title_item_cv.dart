import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class titleItemCv extends StatelessWidget {
  titleItemCv(
      {super.key,
      required this.nameitem,
      required this.onPressed,
      required this.icon});
  final String nameitem;
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(nameitem,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.praimaryColor)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                      color: AppColor.grey,
                      height: 45,
                      width: 45,
                      child: Icon(icon, size: 28, color: AppColor.white))),
              ElevatedButton(
                  onPressed: onPressed, child: Text("Add $nameitem")),
            ],
          ),
        ],
      ),
    );
  }
}
