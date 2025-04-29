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

    // Set loading state at the beginning
    isLoading.value = true;

    try {
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
        // Show success message using SnackBar
        Get.rawSnackbar(
          message: 'On-duty request submitted successfully',
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(15),
          borderRadius: 10,
        );

        // Reset the form
        resetForm();
      } else {
        errorMessage.value = 'Failed to create on-duty request';
        // Show error message
        Get.rawSnackbar(
          message: 'Failed to create on-duty request',
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(15),
          borderRadius: 10,
        );
      }
    } catch (e) {
      errorMessage.value = 'Failed to submit: ${e.toString()}';
      print('Error in submitForm: ${e.toString()}');
      // Show error message
      Get.rawSnackbar(
        message: 'Error: ${e.toString()}',
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(15),
        borderRadius: 10,
      );
    } finally {
      // Always reset loading state, even if there are errors or early returns
      isLoading.value = false;
    }
  }

  // Reset the form fields
  void resetForm() {
    eventNameController.clear();
    dateController.clear();
    locationController.clear();
    registerUrlController.clear();
    descriptionController.clear();
    selectedFiles.clear();
    uploadedFileUrls.clear();
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
