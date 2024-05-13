import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/view/widget/auth/account_type_widget/button_g-to_signup.dart';
import 'package:jobs/view/widget/auth/account_type_widget/icon_type.dart';
import 'package:jobs/view/widget/auth/account_type_widget/text_account_type.dart';
import 'package:jobs/view/widget/auth/account_type_widget/type_chosen.dart';
import '../../../controller/auth/account_type_controller.dart';

class AccountTypePage extends StatelessWidget {
  final AccountTypeController controller = Get.put(AccountTypeController());
  AccountTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.praimaryColor, Colors.grey.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     spreadRadius: 2,
        //     blurRadius: 5,
        //   ),
        // ],
      ),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImageAsset.logo2,
              scale: 5,
            ),
            const TextAccountType(),
            const Divider(
              endIndent: 50,
              indent: 50,
              height: 50,
              thickness: 2,
              color: AppColor.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AccountTypeIcon(
                  icon: Icons.person_search,
                  color: controller.isActiveseeker
                      ? AppColor.praimaryColor
                      : AppColor.grey,
                  onTap: () {
                    controller.setAccountSeeker('Job Seeker');
                  },
                ),
                AccountTypeIcon(
                  icon: Icons.business,
                  color: controller.isActiveCompany
                      ? AppColor.praimaryColor
                      : AppColor.grey,
                  onTap: () {
                    controller.setAccountCompany('company');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AccountTypeChosen(text: '${controller.accountType}'),
            ),
            const SizedBox(
              height: 30,
            ),
            const ButtonGoToSignUp(),
          ],
        ),
      ),
    ));
  }
}
