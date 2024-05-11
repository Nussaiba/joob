import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/color.dart';

class Fields extends StatelessWidget {
  Fields(
      {super.key, required this.list, required this.text, required this.fff});
  List<TextEditingController> list;
  List<FocusNode> fff;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Container(
                        height: 60,
                        child: ListTile(
                          title: TextField(
                            decoration: InputDecoration(
                              hintText: text,
                            ),
                            autofocus: i == list.length - 1 ? true : false,
                            focusNode: fff[i],
                            onChanged: (val) {
                              list[i].text = val;
                            },
                            controller: list[i],
                          ),
                          trailing: IconButton(
                              icon: const Icon(Icons.remove_circle,
                                  color: AppColor.grey),
                              onPressed: () {
                                list.removeAt(i);
                                print(list);
                              }),
                        )),
                  ],
                );
              }),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Divider(
            height: 20,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
            color: AppColor.grey,
          ),
        ),
      ],
    );
  }
}
