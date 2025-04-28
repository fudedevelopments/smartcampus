import 'package:flutter/material.dart';

class UserLoadingIndicator extends StatelessWidget {
  const UserLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 100, // Slightly smaller for a balanced look
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 8, // Less thick for better aesthetics
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
            const SizedBox(height: 16), // Spacing for better layout
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(seconds: 1),
              child: const Text(
                "Fetching user data...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14, // Smaller text size
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


