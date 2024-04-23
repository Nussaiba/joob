import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomDate extends StatelessWidget {
  final String text;

    final void Function()? onTap;

  const CustomDate({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap ,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: AppColor.grey, width: 1)),
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Spacer(
                flex: 1,
              ),
              Text(
              text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColor.black),
              ),
              Spacer(flex: 10),
            const  Icon(Icons.date_range, color: AppColor.praimaryColor,),
           const   Spacer(
                flex: 1,
              )
            ],
          ),
        ));
  }
}
