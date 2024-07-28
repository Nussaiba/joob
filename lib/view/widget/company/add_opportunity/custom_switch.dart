import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:get/get.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;
  const CustomSwitch({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text("184".tr),
      // subtitle: Text(),
      value: value,
      onChanged: onChanged,
      activeColor: AppColor.praimaryColor,
      activeTrackColor: AppColor.pink,
    );
  }
}
