
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class ChosenImageCard extends StatelessWidget {
  const ChosenImageCard({
    super.key,
    required this.image, this.onPressedDelete,
  });
  final File image;
  final void Function()? onPressedDelete;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Image.file(image),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColor.grey,
            child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: onPressedDelete),
          ),
        ),
      ],
    );
  }
}
