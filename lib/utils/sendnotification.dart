import 'package:dio/dio.dart';

Future<void> sendNotification({
  required String id,
  required String table,
  required String title,
  required String message,
  required String authToken, 
}) async {
  final dio = Dio();
  const String lambdaUrl =
      "https://zlj8ylwti7.execute-api.ap-south-1.amazonaws.com/amplify-smartcampus-prave-sendnotificationlambdaE4-0gijNXszj8KN"; // Replace with your API Gateway URL

  try {
    final response = await dio.post(
      lambdaUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken', // Pass token here
        },
      ),
      data: {
        "id": id,
        "table":table,
        "title": title,
        "message": message,
      },
    );

    if (response.statusCode == 200) {
      print("Notification sent successfully: ${response.data}");
    } else {
      print("Failed to send notification: ${response.statusCode}");
    }
  } catch (e) {
    print("Error sending notification: $e");
  }
}
