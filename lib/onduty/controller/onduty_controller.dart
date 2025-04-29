import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartcampus/bloc/userprofile_bloc.dart';
import 'package:smartcampus/models/StudentsUserProfile.dart';
import 'package:smartcampus/models/ModelProvider.dart';
import 'package:smartcampus/onduty/ui/ondutyUI.dart';
import 'package:smartcampus/onduty/repo/ondutyrepo.dart';
import 'package:intl/intl.dart';

class OnDutyController extends GetxController {
  // Repository
  final OnDutyRepository _repository = OnDutyRepository();

  // Form controllers
  final studentNameController = TextEditingController();
  final emailController = TextEditingController();
  final eventNameController = TextEditingController();
  final dateController = TextEditingController();
  final locationController = TextEditingController();
  final registerUrlController = TextEditingController();
  final descriptionController = TextEditingController();

  // Student information from UserprofileBloc
  final Rx<StudentsUserProfile?> studentProfile =
      Rx<StudentsUserProfile?>(null);
  String regNo = '';
  String department = '';
  String year = '';
  String proctor = '';
  String ac = '';
  String hod = '';

  // State variables
  final isLoading = false.obs;
  final selectedFiles = <File>[].obs;
  final uploadedFileUrls = <String>[].obs;
  final formKey = GlobalKey<FormState>();

  // Error handling
  final errorMessage = ''.obs;
  final isSuccess = false.obs;

  // Load student information from UserprofileBloc
  @override
  void onInit() {
    super.onInit();

    // Get BuildContext to access the BlocProvider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadUserProfileData();
    });
  }

  void loadUserProfileData() {
    try {
      final context = Get.context;
      if (context != null) {
        final state = BlocProvider.of<UserprofileBloc>(context).state;
        if (state is UserProfileSucessState) {
          studentProfile.value = state.userProfile;
          // Fill form fields with user data
          studentNameController.text = state.userProfile.name;
          emailController.text = state.userProfile.email;
          regNo = state.userProfile.regNo;
          department = state.userProfile.department;
          year = state.userProfile.year;
          proctor = state.userProfile.Proctor;
          ac = state.userProfile.Ac;
          hod = state.userProfile.Hod;
        }
      }
    } catch (e) {
      errorMessage.value = 'Failed to load user profile: ${e.toString()}';
    }
  }

  void updateFileUrls(List<Map<String, String>> uploadedFiles) {
    for (var file in uploadedFiles) {
      if (file.containsKey('url') && !uploadedFileUrls.contains(file['url'])) {
        uploadedFileUrls.add(file['url']!);
      }
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.indigo,
            colorScheme: const ColorScheme.light(primary: Colors.indigo),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> submitForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Call repository to create OnDuty using student profile data
      final success = await _repository.createOnDuty(
        name: studentNameController.text,
        regNo: regNo, // From user profile
        email: emailController.text,
        department: department, // From user profile
        year: year, // From user profile
        proctor: proctor, // From user profile
        ac: ac, // From user profile
        hod: hod, // From user profile
        eventName: eventNameController.text,
        location: locationController.text,
        date: TemporalDate(DateFormat('yyyy-MM-dd').parse(dateController.text)),
        details: descriptionController.text,
        registeredUrl: registerUrlController.text,
        validDocuments: uploadedFileUrls.toList(),
      );

      if (success) {
        isSuccess.value = true;
        Get.snackbar(
          'Success',
          'On-duty request submitted successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );

        // Navigate to OnDuty UI after successful submission
        await Future.delayed(const Duration(seconds: 2));
        Get.offAll(() => const OndutyUI());
      } else {
        errorMessage.value = 'Failed to create on-duty request';
        throw Exception('Failed to create on-duty request');
      }
    } catch (e) {
      errorMessage.value = 'Failed to submit: ${e.toString()}';
      Get.snackbar(
        'Error',
        errorMessage.value,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    studentNameController.dispose();
    emailController.dispose();
    eventNameController.dispose();
    dateController.dispose();
    locationController.dispose();
    registerUrlController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
