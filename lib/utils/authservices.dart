import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;

  AuthService._internal();

  String? _idToken;
  String? _email;
  String? _sub;
  bool _isSignedIn = false;

  String? get idToken => _idToken;
  String? get email => _email;
  String? get sub => _sub;
  bool get isSignedIn => _isSignedIn;

  Future<void> fetchIdToken() async {
    try {
      final result =
          await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;
      _isSignedIn = result.isSignedIn;
      if (_isSignedIn) {
        _idToken = result.userPoolTokensResult.value.idToken.raw;
        print('ID Token fetched successfully');
      } else {
        print('User is not signed in');
      }
    } on AuthException catch (e) {
      print('Error retrieving auth session: ${e.message}');
    }
  }

  Future<void> fetchUserAttributes() async {
    try {
      final result = await Amplify.Auth.fetchUserAttributes();

      for (final element in result) {
        if (element.userAttributeKey.key == 'email') {
          _email = element.value;
        } else if (element.userAttributeKey.key == 'sub') {
          _sub = element.value;
        }
      }
      print('User attributes fetched successfully');
    } on AuthException catch (e) {
      print('Error fetching user attributes: ${e.message}');
    }
  }
}
