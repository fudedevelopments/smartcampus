import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class CustomSignUpForm extends StatelessWidget {
  final AuthenticatorState? state;

  const CustomSignUpForm({Key? key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "STUDENT REGISTRATION",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2196F3), 
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD), // Very light blue
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF64B5F6)), // Light blue
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.info_outline,
                        color: Color(0xFF1E88E5)), // Medium blue
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Registration Information',
                        style: TextStyle(
                          color: Color(0xFF1976D2), // Medium blue
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please use your official Nandha Engineering College email address to register. All fields are required.',
                  style: TextStyle(
                    color: Color(0xFF2196F3), // Light blue
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Use the built-in SignUpForm with custom theme
          Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.grey.shade50,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Color(0xFFBBDEFB)), // Lighter blue border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Color(0xFF2196F3), width: 2), // Medium blue
                ),
                labelStyle:
                    const TextStyle(color: Color(0xFF64B5F6)), // Light blue
                floatingLabelStyle:
                    const TextStyle(color: Color(0xFF1E88E5)), // Medium blue
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2), // Medium-dark blue
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF2196F3), // Light blue
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              checkboxTheme: CheckboxThemeData(
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF2196F3); // Light blue
                    }
                    return Colors.grey.shade400;
                  },
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            child: Column(
              children: [
                SignUpForm(),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Navigate back to sign in
                    if (state != null) {
                      state!.changeStep(AuthenticatorStep.signIn);
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF2196F3),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 8),
                      Text(
                        "Back to Sign In",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Footer note
          const SizedBox(height: 20),
          const Text(
            "© 2025 Nandha Engineering College",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF64B5F6), // Light blue
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
