import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/settings/deletaccount_controller.dart';

class DeleteAccountPage extends StatelessWidget {
  final DeleteAccountController controller = Get.put(DeleteAccountControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حذف الحساب'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.warning,
              color: Colors.red,
              size: 80.0,
            ),
            SizedBox(height: 20),
            Text(
              'هل أنت متأكد من أنك تريد حذف حسابك؟',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'إذا قمت بحذف حسابك، لن تتمكن من استرجاع البيانات في المستقبل. يرجى التأكد قبل المتابعة.',
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('حذف الحساب'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.purple,
              ),
              onPressed: () {
                
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('تأكيد الحذف'),
                      content: Text('هل أنت متأكد من أنك تريد حذف حسابك نهائيًا؟'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('إلغاء'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('حذف'),
                          onPressed: () {
                            
                            controller.deleteAccount();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
