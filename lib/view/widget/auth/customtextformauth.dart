import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final String? Function(String?)? valid;
  const CustomTextFormAuth(
      {super.key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      this.mycontroller,
      required this.valid});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)),
            suffixIcon: InkWell(
              child: Icon(iconData),
              onTap: onTapIcon,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
