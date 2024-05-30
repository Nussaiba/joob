
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String? content;
  final IconData icon;

  const InfoRow(
      {super.key, required this.title, this.content, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 2.3,
      height: 45,
      //   padding: EdgeInsets.all(10),
      //  color: Colors.pink.shade100,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.deepPurple,
          size: 20,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        // subtitle: Text(contcontent!),
      ),
    );
  }
}
