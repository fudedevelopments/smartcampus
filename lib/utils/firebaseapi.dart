import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebasemessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebasemessaging.requestPermission();
    final fcmtoken = await _firebasemessaging.getToken();
    print("token ${fcmtoken}");
  }
}
