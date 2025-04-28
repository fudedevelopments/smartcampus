import 'package:flutter/material.dart';

class ReadOnlyTextField extends StatelessWidget {
  final String text;

  const ReadOnlyTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Takes full screen width
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light background like a disabled TextField
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(color: Colors.grey[400]!), // Border similar to TextField
      ),
      child: Align(
        alignment: Alignment.centerLeft, // Align text to the start
        child: Text(
          text,
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
      ),
    );
  }
}
