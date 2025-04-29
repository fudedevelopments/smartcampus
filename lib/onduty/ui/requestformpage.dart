// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcampus/bloc/userprofile_bloc.dart';
import 'package:smartcampus/components/file_pick.dart';
import 'package:smartcampus/models/StudentsUserProfile.dart';
import 'package:smartcampus/onduty/controller/onduty_controller.dart';

class ElegantForm extends StatefulWidget {
  const ElegantForm({
    super.key,
  });
  @override
  // ignore: library_private_types_in_public_api
  _ElegantFormState createState() => _ElegantFormState();
}

class _ElegantFormState extends State<ElegantForm>
    with SingleTickerProviderStateMixin {
  final OnDutyController controller = Get.put(OnDutyController());
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New On-Duty Request',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo.shade50,
                  Colors.white,
                ],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: Container(
                          width: constraints.maxWidth > 800
                              ? 800
                              : constraints.maxWidth,
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildAnimatedSection(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildSectionTitle('Student Information'),
                                      BlocBuilder<UserprofileBloc,
                                          UserprofileState>(
                                        builder: (context, state) {
                                          if (state is UserProfileSucessState) {
                                            // Update controller values with profile data
                                            controller.studentNameController
                                                .text = state.userProfile.name;
                                            controller.emailController.text =
                                                state.userProfile.email;
                                            controller.regNo =
                                                state.userProfile.regNo;
                                            controller.department =
                                                state.userProfile.department;
                                            controller.year =
                                                state.userProfile.year;
                                            controller.proctor =
                                                state.userProfile.Proctor;
                                            controller.ac =
                                                state.userProfile.Ac;
                                            controller.hod =
                                                state.userProfile.Hod;

                                            return _buildInfoCard(
                                                state.userProfile);
                                          } else if (state
                                              is UserProfileLoadingState) {
                                            return const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(20.0),
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          } else {
                                            return const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(20.0),
                                                child: Text(
                                                    "Profile information not available"),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  delay: 0,
                                ),

                                const SizedBox(height: 24),

                                _buildAnimatedSection(
                                  child: _buildSectionTitle('Request Details'),
                                  delay: 0.2,
                                ),

                                // Responsive layout for larger screens
                                if (constraints.maxWidth > 600)
                                  _buildAnimatedSection(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: _buildInputField(
                                            label: 'Request Name',
                                            hint:
                                                'Enter the name of your request',
                                            controller:
                                                controller.eventNameController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter a request name';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: _buildDatePicker(),
                                        ),
                                      ],
                                    ),
                                    delay: 0.3,
                                  )
                                else
                                  Column(
                                    children: [
                                      _buildAnimatedSection(
                                        child: _buildInputField(
                                          label: 'Request Name',
                                          hint:
                                              'Enter the name of your request',
                                          controller:
                                              controller.eventNameController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter a request name';
                                            }
                                            return null;
                                          },
                                        ),
                                        delay: 0.3,
                                      ),
                                      _buildAnimatedSection(
                                        child: _buildDatePicker(),
                                        delay: 0.4,
                                      ),
                                    ],
                                  ),

                                _buildAnimatedSection(
                                  child: _buildInputField(
                                    label: 'Description',
                                    hint: 'Provide details about your request',
                                    controller:
                                        controller.descriptionController,
                                    maxLines: 4,
                                  ),
                                  delay: 0.5,
                                ),

                                // Responsive layout for larger screens
                                if (constraints.maxWidth > 600)
                                  _buildAnimatedSection(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: _buildInputField(
                                            label: 'Location',
                                            hint: 'Enter the location',
                                            controller:
                                                controller.locationController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter a location';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: _buildInputField(
                                            label: 'Registration URL',
                                            hint:
                                                'Enter the event registration URL (if any)',
                                            controller: controller
                                                .registerUrlController,
                                          ),
                                        ),
                                      ],
                                    ),
                                    delay: 0.6,
                                  )
                                else
                                  Column(
                                    children: [
                                      _buildAnimatedSection(
                                        child: _buildInputField(
                                          label: 'Location',
                                          hint: 'Enter the location',
                                          controller:
                                              controller.locationController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter a location';
                                            }
                                            return null;
                                          },
                                        ),
                                        delay: 0.6,
                                      ),
                                      _buildAnimatedSection(
                                        child: _buildInputField(
                                          label: 'Registration URL',
                                          hint:
                                              'Enter the event registration URL (if any)',
                                          controller:
                                              controller.registerUrlController,
                                        ),
                                        delay: 0.7,
                                      ),
                                    ],
                                  ),

                                const SizedBox(height: 24),

                                _buildAnimatedSection(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildSectionTitle(
                                          'Supporting Documents'),
                                      const SizedBox(height: 8),
                                      FilePickerBoxUI(
                                        selectfiles: controller.selectedFiles,
                                        onFilesUpdated:
                                            controller.updateFileUrls,
                                      ),
                                    ],
                                  ),
                                  delay: 0.8,
                                ),

                                const SizedBox(height: 32),

                                _buildAnimatedSection(
                                  child: _buildSubmitButton(),
                                  delay: 0.9,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          if (controller.isLoading.value) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildAnimatedSection({required Widget child, required double delay}) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        final start = delay;
        final end = delay + 0.4;
        final value = (_animationController.value - start) / (end - start);
        final opacity = value.clamp(0.0, 1.0);
        final offset = (1 - opacity) * 20;

        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(0, offset),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildLoadingOverlay() {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  color: Colors.indigo,
                ),
                const SizedBox(height: 16),
                Text(
                  'Submitting...',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.indigo.shade800,
        ),
      ),
    );
  }

  Widget _buildInfoCard(StudentsUserProfile profile) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.indigo.shade100,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReadOnlyField(
              label: 'Name',
              text: profile.name,
              icon: Icons.person,
            ),
            const Divider(height: 24),
            _buildReadOnlyField(
              label: 'Registration No',
              text: profile.regNo,
              icon: Icons.numbers,
            ),
            const Divider(height: 24),
            _buildReadOnlyField(
              label: 'Email',
              text: profile.email,
              icon: Icons.email,
            ),
            const Divider(height: 24),
            _buildReadOnlyField(
              label: 'Department',
              text: profile.department,
              icon: Icons.school,
            ),
            const Divider(height: 24),
            _buildReadOnlyField(
              label: 'Year',
              text: profile.year,
              icon: Icons.calendar_today,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField({
    required String label,
    required String text,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.indigo.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.indigo.shade600,
            size: 22,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.indigo.shade700,
              ),
            ),
          ),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey.shade400,
                fontSize: 14,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.indigo.shade200,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.indigo.shade200,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.indigo.shade400,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.red.shade300,
                  width: 1,
                ),
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
            child: Text(
              'Date',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.indigo.shade700,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => controller.selectDate(context),
            child: AbsorbPointer(
              child: TextFormField(
                controller: controller.dateController,
                decoration: InputDecoration(
                  hintText: 'Select a date',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: Colors.indigo.shade400,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.indigo.shade200,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.indigo.shade200,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.indigo.shade400,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => controller.submitForm(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          'Submit Request',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
