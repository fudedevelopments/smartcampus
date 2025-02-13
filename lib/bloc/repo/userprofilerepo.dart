import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:smartcampus/models/StudentsUserProfile.dart';

class UserProfileRepo {
  Future<StudentsUserProfile?> getUserProfile({required String userId}) async {
    try {
      final response = await Amplify.API
          .query(
            request: ModelQueries.get(
              StudentsUserProfile.classType,
              StudentsUserProfileModelIdentifier(id: userId),
            ),
          )
          .response;
      if (response.hasErrors) {
        throw response.errors.first;
      }

      return response.data;
    } on ApiException catch (e) {
      throw Exception("API Error: ${e.message}");
    } on UnauthorizedException {
      throw Exception("Unauthorized Access");
    } catch (e) {
      throw Exception("Unknown Error: $e");
    }
  }

  Future<GraphQLResponse> createUserProfile({required StudentsUserProfile userprofile}) async {
    try {
      final createstudentuser = ModelMutations.create(userprofile);
      final response =
          await Amplify.API.mutate(request: createstudentuser).response;

      if (response.errors.isNotEmpty) {
        throw Exception("API Error: ${response.errors.first.message}");
      }
      return response;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
