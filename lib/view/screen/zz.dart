import 'package:flutter/material.dart';
import 'package:jobs/core/constants/imageassest.dart';

class ImageDropdown extends StatefulWidget {
  @override
  _ImageDropdownState createState() => _ImageDropdownState();
}

class _ImageDropdownState extends State<ImageDropdown> {
  String? selectedValue;

  List<Map> items = [
    {
      'value': 'option1',
      'image': AppImageAsset.logo,
      'text': 'الخيار الأول',
    },
    {
      'value': 'option2',
      'image': AppImageAsset.logo,
      'text': 'الخيار الثاني',
    },
    // يمكنك إضافة المزيد من الخيارات هنا
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text('اختر خيارًا'),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          items: items.map((Map item) {
            return DropdownMenuItem<String>(
              value: item['value'],
              child: Row(
                children: <Widget>[
                  Image.asset(
                    item['image'],
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(width: 10),
                  Text(item['text']),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
