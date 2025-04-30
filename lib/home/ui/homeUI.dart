import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:smartcampus/utils/authservices.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final token = AuthService().idToken!;
    final dio = Dio();
    const url = 'https://c3n6lbtgl0.execute-api.ap-south-1.amazonaws.com/items';

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      print('Response data: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test API")),
      body: Center(
        child: Text("Check console for API result"),
      ),
    );
  }
}
