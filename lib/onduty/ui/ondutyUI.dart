import 'package:flutter/material.dart';
import 'package:smartcampus/onduty/ui/requestformpage.dart';
import 'package:smartcampus/utils/utils.dart';

class OndutyUI extends StatefulWidget {
  const OndutyUI({super.key});
  @override
  State<OndutyUI> createState() => _OndutyUIState();
}

class _OndutyUIState extends State<OndutyUI> {


  void handleFilesUpdated(List<Map<String, String>> uploadedFiles) {
    for (var file in uploadedFiles) {
      print("Uploaded File URL: ${file['url']}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("File Upload")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigationpush(context, ElegantForm());
          },
          child: Icon(Icons.add)),
    );
  }
}
