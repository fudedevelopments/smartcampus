import 'package:flutter/material.dart';
import 'package:smartcampus/onduty/ui/requestformpage.dart';

class OndutyUI extends StatelessWidget {
  const OndutyUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, (MaterialPageRoute(builder: (context) => ElegantForm())));
        },
        child: Icon(Icons.add),
      ),
      body: Text("OndutyUI"),
    );
  }
}
