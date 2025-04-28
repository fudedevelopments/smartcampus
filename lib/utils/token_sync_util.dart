import 'package:smartcampusstaff/models/StaffUserProfile.dart';
import 'package:smartcampusstaff/utils/firebaseapi.dart';
import 'package:smartcampusstaff/bloc/repo/userprofilerepo.dart';

/// Utility class for synchronizing device tokens between Firebase and the backend
class TokenSyncUtil {
  static final TokenSyncUtil _instance = TokenSyncUtil._internal();
  factory TokenSyncUtil() => _instance;

  TokenSyncUtil._internal();

  bool _isSyncing = false;

  /// Checks if the device token needs to be updated and updates it in the background
  /// This method is designed to run without affecting the UI
  Future<void> syncDeviceToken(StaffUserProfile userProfile) async {
    // Prevent multiple sync operations running simultaneously
    if (_isSyncing) return;

    _isSyncing = true;

    try {
      // Get current token from Firebase
      final currentToken = FirebaseApi().token;

      // If token is null or same as stored, no need to update
      if (currentToken == null || currentToken == userProfile.deviceToken) {
        _isSyncing = false;
        return;
      }

      print('Device token mismatch detected. Updating...');
      print('Current token in profile: ${userProfile.deviceToken}');
      print('New token from Firebase: $currentToken');

      // Create updated user profile with new token
      final updatedProfile = userProfile.copyWith(deviceToken: currentToken);

      // Update the token in the backend
      await UserProfileRepo()
          .updateUserProfileStaff(userprofile: updatedProfile);

      print('Device token updated successfully');
    } catch (e) {
      print('Error updating device token: $e');
      // Silently fail to avoid disturbing UI
    } finally {
      _isSyncing = false;
    }
  }
}
