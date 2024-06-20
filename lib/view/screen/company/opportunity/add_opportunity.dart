import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company/add_oportunity_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/general/custom_dropdown_button.dart';
import 'package:jobs/view/widget/company/add_opportunity/custom_switch.dart';
import 'package:jobs/view/widget/general/custom_text_field.dart';
import 'package:jobs/view/widget/general/Custom_choose_image.dart';
import 'package:jobs/view/widget/general/custom_button.dart';
import '../../../widget/company/add_opportunity/custom_warp.dart';

class AddJobOpportunityScreen extends StatelessWidget {
  const AddJobOpportunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewOpportunityControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add new opportunity',
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GetBuilder<AddNewOpportunityControllerImp>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Form(
                key: controller.formstate,
                child: ListView(children: [
                  const CustomTextBodyAuth(
                      text:
                          "Add your job opportunity here \n Please fill out the following fields "),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomChooseImage(
                    onTap: () {
                      controller.getImage();
                    },
                    image: controller.file,
                  ),
                  CustomTextFieldInfo(
                    icon: Icons.title,
                    label: 'title',
                    hint: 'Enter opportunity title ',
                    mycontroller: controller.title,
                    valid: (val) {
                      return validInputIsEmpty(val!);
                    },
                  ),
                  CustomTextFieldInfo(
                    icon: Icons.info_outline,
                    label: 'description',
                    hint: 'Enter opportunity description',
                    mycontroller: controller.body,
                    valid: (val) {
                      return validInputIsEmpty(val!);
                    },
                  ),
                  CustomTextFieldInfo(
                    icon: Icons.location_on,
                    label: 'location',
                    hint: 'Enter opportunity description',
                    mycontroller: controller.location,
                    valid: (val) {
                      return validInputIsEmpty(val!);
                    },
                  ),
                  CustomTextFieldInfo(
                    icon: Icons.schedule,
                    label: 'job Hours',
                    hint: 'Enter job Hours',
                    mycontroller: controller.jophours,
                    keyboardType: TextInputType.number,
                    valid: (val) {
                      return validInputIsEmpty(val!);
                    },
                  ),
                  CustomTextFieldInfo(
                    icon: Icons.attach_money,
                    label: 'Salary',
                    hint: 'Enter opportunity salary',
                    mycontroller: controller.salary,
                    keyboardType: TextInputType.number,
                    valid: (val) {
                      return validInputIsEmpty(val!);
                    },
                  ),
                  Column(
                    children: [
                      CustomTextFieldInfo(
                        icon: Icons.local_library,
                        label: 'qualifications',
                        hint: 'Enter opportunity qualifications',
                        mycontroller:
                            controller.textEditingControllerqualifications,
                        iconsuffix: Icons.add,
                        onPressedsuffix: () {
                          controller.addQualifications(controller
                              .textEditingControllerqualifications.text
                              .trim());
                          controller.textEditingControllerqualifications
                              .clear();
                        },
                        onSubmitted: (value) {
                          controller.addQualifications(value.trim());
                          print(controller.qualifications);
                          controller.textEditingControllerqualifications
                              .clear();
                        },
                      ),
                      CustomWarp(
                        list: controller.qualifications,
                        selectedIndex: controller.selectedQualificationsIndex,
                        onSelected: (index) {
                          controller.selectQualification(index);
                          controller.textEditingControllerqualifications.text =
                              controller.qualifications[index];
                        },
                        onDelete: (index) {
                          controller.deleteQualification(index);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomTextFieldInfo(
                        icon: Icons.emoji_objects,
                        label: 'Skills',
                        hint: 'Enter opportunity skills',
                        mycontroller: controller.textEditingControllerskill,
                        iconsuffix: Icons.add,
                        onPressedsuffix: () {
                          controller.addSkill(controller
                              .textEditingControllerskill.text
                              .trim());
                          controller.textEditingControllerskill.clear();
                        },
                        onSubmitted: (value) {
                          controller.addSkill(value.trim());
                          controller.textEditingControllerskill.clear();
                        },
                      ),
                      CustomWarp(
                        list: controller.skills,
                        selectedIndex: controller.selectedSkillIndex,
                        onSelected: (index) {
                          controller.selectSkill(index);
                          controller.textEditingControllerskill.text =
                              controller.skills[index];
                        },
                        onDelete: (index) {
                          controller.deleteSkill(index);
                        },
                      ),
                    ],
                  ),
                  CustomDropDownButton(
                    label: 'Job Type',
                    hint: 'Enter job Types ',
                    items: controller.jobTypes,
                    selectedItem: controller.selectedJobType,
                    icon: Icons.work,
                    onChanged: controller.setSelectedJobType,
                  ),
                  CustomDropDownButton(
                    label: 'Work Place Type',
                    hint: 'Enter Work Place Type',
                    items: controller.workPlaceTypes,
                    selectedItem: controller.selectedWorkPlaceType,
                    icon: Icons.home_work,
                    onChanged: controller.setSelectedWorkPlaceType,
                  ),
                  CustomSwitch(
                    value: controller.isVacant,
                    onChanged: controller.setVacant,
                  ),
                  OpportunityButton(
                      title: 'Add Opportunity ',
                      //onPressed: controller.addOpportunity(),
                      onPressed: () {
                        controller.showJobPreviewBottomSheet(context);
                      }),
                ]),
              ),
            ),
          )),
    );
  }
}
