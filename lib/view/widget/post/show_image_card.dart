
import 'package:flutter/material.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/constants/color.dart';

class ShowImageCard extends StatelessWidget {
  const ShowImageCard({
    super.key,
    required this.onPressedDelete,
    required this.imageName,
  });
  final void Function()? onPressedDelete;
  final String imageName;
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
          child: Image.network("${AppLink.serverimage}/${imageName}"),
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
