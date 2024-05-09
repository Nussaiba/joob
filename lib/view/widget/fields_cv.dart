import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/apply_job/create_cv_controller.dart';
import '../../core/constants/color.dart';

class Fields extends StatelessWidget {
  const Fields({super.key, required this.list, required this.text});
 
  final List<String> list;
final String text;
  @override
  Widget build(BuildContext context) {
    return Obx(
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
                          hintText:text
                        ),
                        onChanged: (val) {
                          list[i] = val;
                        },
                        controller:
                        
                       TextEditingController(text: list[i]),
                      ),
                      trailing: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            list.removeAt(i);
                            print(list);
                          }),
                    )),
                const Divider(
                  height: 20,
                  thickness: 0.5,
                  indent: 20,
                  endIndent: 20,
                  color: AppColor.grey,
                ),
              ],
            );
          }),
    );
  }
}
