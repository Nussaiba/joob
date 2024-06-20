

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:file_picker/file_picker.dart';

class SendCVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for Opportunity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'To apply for the opportunity, upload your CV here.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
               FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
               );

                if (result != null) {
                  /// Logic to handle the selected file
                  print("CV Uploaded");
                } else {
                  // User canceled the picker
                }
              },
              icon: Icon(Icons.upload_file),
              label: Text('Upload CV'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to CV creation page or show a dialog
                print("Navigate to CV creation page");
              },
              child: Text('If you do not have a CV, create one here.'),
            )
          ],
        ),
      ),
    );
  }
}

