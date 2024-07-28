import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu(
      {super.key,
      required this.isOwner,
      this.onPressedEdit,
      this.onPressedDelete,
      this.onPressedReport, this.onSelected});
  final bool isOwner;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;
  final void Function()? onPressedReport;
final void Function(String)? onSelected;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColor.white,
      iconColor: AppColor.white,
      onSelected: (value) {
        switch (value) {
          case 'edit':
            () {
              print("jjjjjjjjjjjjjjjjjjjjjjj");
              onPressedEdit;
            };
            // controller.goToEditPage(
            //     controller.opportuntiyModel);
            break;
          case 'delete':
            () {
              onPressedDelete;
            };
            // controller.deleteOpportunity(
            //     controller.opportuntiyModel.id!);
            break;
          case 'report':
            () {
              onPressedReport;
            };
            // controller.reportUser(controller.companyModel.id!);
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return isOwner
            ? <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: 'edit',
                  child: Text("Edit"),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text("Delete"),
                ),
              ]
            : <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: 'report',
                  child: Text("Report"),
                ),
              ];
      },
    );
  }
}
