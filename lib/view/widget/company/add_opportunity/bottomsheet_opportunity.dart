import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';
import 'package:jobs/view/widget/company/add_opportunity/info_bottomsheet.dart';
import 'package:jobs/view/widget/company/add_opportunity/simple_list.dart';
import 'package:jobs/view/widget/general/custom_button.dart';

class BottomSheetOpportunity extends StatelessWidget {
  final File? image;
  final String title;
  final String body;
  final String location;
  final String jobType;
  final String workPlaceType;
  final String jobHours;
  final List<String> qualifications;
  final List<String> skills;
  final String salary;
  final String vacant;
  final void Function()? onPressedPublish;
  final void Function()? onPressedBack;

  const BottomSheetOpportunity({
    
    super.key, this.image, required this.title, required this.body, required this.location, required this.jobType, required this.workPlaceType, required this.jobHours, required this.qualifications, required this.skills, required this.salary, required this.vacant, this.onPressedPublish, this.onPressedBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                   const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Center(child: CustomTextTitleAuth(text: 'Jop Preview',)),
                   ),
                ListTile(
                  title: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, height: 2),
                  ),
                  subtitle: Text(
                    '  ${body.length > 20 ? '${body.substring(0, 20)}...' : body}',
                    style: const TextStyle(fontSize: 16, height: 1),
                  ),
                  trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: image != null
                          ? Image.file(
                              image!,
                              //  width: 100,
                              //    height: 120,
                              //fit: BoxFit.cover,
                            )
                          : null),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InfoRow(
                      title: location,
                      // content: location,
                      icon: Icons.location_on,
                    ),
                    InfoRow(
                      title: GetStringUtils(
                              jobType.toString().replaceAll('_', ' '))
                          .capitalizeFirst!,
                      icon: Icons.work,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InfoRow(
                      title: GetStringUtils(
                              workPlaceType.toString().replaceAll('_', ' '))
                          .capitalizeFirst!,
                      icon: Icons.home_work,
                    ),
                    InfoRow(
                      title: jobHours,
                      icon: Icons.schedule,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InfoRow(
                      title: salary,
                      icon: Icons.attach_money_rounded,
                    ),
                    InfoRow(title: vacant, icon: Icons.event_seat),
                  ],
                ),
                const InfoRow(title: 'skills', icon: Icons.lightbulb_outline),
                CustomSimpleList(
                  list: skills,
                ),
                const InfoRow(title: 'qualification', icon: Icons.school),
                CustomSimpleList(
                  list: qualifications,
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OpportunityButton(
                  onPressed: onPressedPublish,
                  title: 'Publish',
                ),
                OpportunityButton(
                  onPressed: onPressedBack,
                  title: 'Back',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
