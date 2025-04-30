import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:smartcampus/models/onDutyModel.dart';
import 'package:uuid/uuid.dart';

class OnDutyRepository {
  Future<bool> createOnDuty({
    required String name,
    required String regNo,
    required String email,
    required String department,
    required String year,
    required String student,
    required String proctor,
    required String ac,
    required String hod,
    required String eventName,
    required String location,
    required TemporalDate date,
    String? details,
    required String registeredUrl,
    required List<String> validDocuments,
  }) async {
    try {
      final onduty = onDutyModel(
        id: const Uuid().v4(),
        name: name,
        regNo: regNo,
        email: email,
        department: department,
        year: year,
        student: student,
        Proctor: proctor,
        Ac: ac,
        Hod: hod,
        eventname: eventName,
        location: location,
        date: date,
        details: details,
        registeredUrl: registeredUrl,
        validDocuments: validDocuments,
        proctorstatus: "PENDING",
        AcStatus: "PENDING",
        HodStatus: "PENDING",
        createdAt: TemporalTimestamp.now(),
      );

      final request = ModelMutations.create(onduty);
      final response = await Amplify.API.mutate(request: request).response;
      if (response.errors.isEmpty) {
        return true;
      } else {
        throw Exception(response.errors.first.message);
      }
    } catch (e) {
      print('Error creating on-duty: $e');
      return false;
    }
  }
}
