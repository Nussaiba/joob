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
        child: Column(children: [
          // ClipRRect(
          //  // child: Image.file(File(con.imagepath!)),
          // ),
          //languages
          titleItemCv(
            nameitem: "languages",
            onPressed: () {
              con.addLanguages(con.language);
              print("${con.language}");
            },
            icon: Icons.language,
          ),
          Fields(
            fff: con.focuseslanguages,
            list: con.language,
            text: "pr",
          ),
          //skills
          titleItemCv(
            nameitem: "skills",
            onPressed: () {
              // con.skills.add(TextEditingController());
              print("${con.skills}");
              con.addSkills(con.skills);
            },
            icon: Icons.build,
          ),
          Fields(
            list: con.skills,
            text: "projects",
            fff: con.focusesskills,
          ),

          //projects
          titleItemCv(
            nameitem: "projects",
            onPressed: () {
              //  con.projects.add(TextEditingController());
              con.addprojects(con.projects);
            },
            icon: Icons.work,
          ),
          Fields(
            list: con.projects,
            text: "projects",
            fff: con.focusesprojects,
          ),
          /////certificates
          titleItemCv(
            nameitem: 'certificates',
            onPressed: () {
              // con.certificates.add(TextEditingController());
              con.addcertificates(con.certificates);
              print("${con.certificates}");
            },
            icon: Icons.card_membership,
          ),

          Fields(
            list: con.certificates,
            text: "projects",
            fff: con.focusescertificates,
          ),
          ///// experiences

          titleItemCv(
            nameitem: 'experiences',
            onPressed: () {
              //con.profile.add(TextEditingController());\

              con.addexperiences(con.experiences);
              print("${con.experiences}");
            },
            icon: Icons.timeline,
          ),
          Fields(
              list: con.experiences,
              text: "projects",
              fff: con.focusesexperiences),

          /////contacts
          titleItemCv(
            nameitem: 'contacts',
            onPressed: () {
              // con.profile.add(TextEditingController());
              con.addcontacts(con.contacts);
              print("${con.contacts}");
            },
            icon: Icons.contacts,
          ),
          Fields(
              list: con.contacts, text: "projects", fff: con.focusescontacts),

          Container(
            color:AppColor.praimaryColor,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Create CV',
                style: TextStyle(color: AppColor.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}


