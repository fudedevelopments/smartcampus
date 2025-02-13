import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final Future<String> imageUrlFuture;

  const ImageDisplay({
    super.key,
    required this.imageUrlFuture,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
          future: imageUrlFuture,
          builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator(); 
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else if (snapshot.hasData) {
      return Image.network(snapshot.data!); 
    } else {
      return const Text('No image URL found');
    }
          },
        );
  }
}

