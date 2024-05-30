import 'package:flutter/material.dart';

class CustomSimpleList extends StatelessWidget {
  final List<String> list;
  const CustomSimpleList({
    super.key, required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(right: 30),
      height: 110,
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Text('_  ${list[index]}', style:const TextStyle(fontSize: 16),);
        },
      ),
    );
  }
}
