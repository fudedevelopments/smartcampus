import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smartcampus/components/file_pick.dart';

class OndutyUI extends StatefulWidget {
  
  const OndutyUI({super.key});
  @override
  State<OndutyUI> createState() => _OndutyUIState();
}

class _OndutyUIState extends State<OndutyUI> {
   List<File> selectedFiles = [];

    void handleFilesUpdated(List<Map<String, String>> uploadedFiles) {
    for (var file in uploadedFiles) {
      print("Uploaded File URL: ${file['url']}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("File Upload")),
      body: Center(
        child: FilePickerBoxUI(
          selectfiles: selectedFiles,
          onFilesUpdated: handleFilesUpdated,
        ),
      ),
    );
  }
}
