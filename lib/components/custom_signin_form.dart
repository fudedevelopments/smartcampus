import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // NEC Staff Portal heading
          const Text(
            "STAFF LOGIN",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A237E), // NEC dark blue
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          // Domain restriction note
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: const Color(0xFFE8EAF6), // Light NEC blue
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: const Color(0xFF3949AB)), // NEC medium blue
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.info_outline,
                        color: Color(0xFF1A237E)), // NEC dark blue
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Staff Login Restrictions',
                        style: TextStyle(
                          color: Color(0xFF1A237E), // NEC dark blue
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Only Registered Nandha Engineering College email addresses (@nandhaengg.org) are permitted to access the staff portal.',
                  style: TextStyle(
                    color: Color(0xFF3949AB), // NEC medium blue
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Use the built-in SignInForm with custom theme
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
                      color: Color(0xFFC5CAE9)), // Light NEC blue border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Color(0xFF3949AB), width: 2), // NEC medium blue
                ),
                labelStyle:
                    const TextStyle(color: Color(0xFF5C6BC0)), // NEC light blue
                floatingLabelStyle: const TextStyle(
                    color: Color(0xFF3949AB)), // NEC medium blue
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A237E), // NEC dark blue
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
                  foregroundColor: const Color(0xFF3949AB), // NEC medium blue
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              checkboxTheme: CheckboxThemeData(
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF3949AB); // NEC medium blue
                    }
                    return Colors.grey.shade400;
                  },
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            child: SignInForm(),
          ),

          // Footer note
          const SizedBox(height: 20),
          const Text(
            "© 2025 Nandha Engineering College",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF5C6BC0), // NEC light blue
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
