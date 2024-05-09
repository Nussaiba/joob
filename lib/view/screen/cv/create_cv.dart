import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/apply_job/create_cv_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/fields_cv.dart';
import '../../widget/cv/title_item_cv.dart';

class CV extends StatelessWidget {
  final CreateCvController con = Get.put(CreateCvController());
  CV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Create Cv',
            style: TextStyle(color: AppColor.white),
          ),
          backgroundColor: AppColor.praimaryColor),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          
          children: [
            ClipRRect(
             // child: Image.file(File(con.imagepath!)),
            ),
            ////languages
            titleItemCv(
                nameitem: "language",
                onPressed: () {
                  con.language.add('');
                            print("${con.language}");
                },
                icon: Icons.language,),

            Fields(list: con.language, text: "projects", ),
            // ////skills
            // titleItemCv(
            //     nameitem: "skills",
            //     onPressed: () {
            //       con.skills.add('');
            //     },
            //   icon: Icons.build,),
            // Fields(list: con.skills, text: "projects",),
            ////projects
            // titleItemCv(
            //     nameitem: "projects",
            //     onPressed: () {
            //       con.projects.add('');
            //     },
            //       icon: Icons.work,),
            // Fields(list: con.projects, text: "projects",),
            // /////certificates
            // titleItemCv(
            //     nameitem: 'certificates',
            //     onPressed: () {
            //       con.certificates.add("value");
            //       print("${con.certificates}");
            //     },
            //    icon: Icons.card_membership,),

            // Fields(list: con.certificates, text: "projects",),
            // ///// experiences

            // titleItemCv(
            //     nameitem: 'experiences',
            //     onPressed: () {
            //       con.profile.add(" ");
            //       print("${con.experiences}");
            //     },
            //     icon: Icons.timeline,),
            // Fields(list: con.experiences, text: "projects",),

            // /////contacts

            // titleItemCv(
            //     nameitem: 'contacts',
            //     onPressed: () {
            //       con.profile.add(" ");
            //       print("${con.contacts}");
            //     },
                
            //     icon: Icons.contacts,),
            // Fields(list: con.contacts,  text: "projects",),
            // ////create a pdf
            // titleItemCv(
            //     nameitem: 'create',
            //     onPressed: () {
            //       con.create();
            //     },
            //    icon: Icons.language,),
       ] ),
      ),
    );
  }
}
