import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:smartcampus/components/customscaffold.dart';

class AuthenticatorWidget extends StatelessWidget {
  final Widget child;
  const AuthenticatorWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return CustomScaffold(
              state: state,
              body: Column(
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    "Welcome to Smart Campus",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Student SignIn",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SignInForm(),
                ],
              ),
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () => state.changeStep(AuthenticatorStep.signUp),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.signUp:
            return CustomScaffold(
              state: state,
              body: Column(
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    "Welcome to Smart Campus",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Student SignUp",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SignUpForm(),
                ],
              ),
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => state.changeStep(AuthenticatorStep.signIn),
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.confirmSignUp:
            return CustomScaffold(
              state: state,
              body: ConfirmSignUpForm(),
            );
          case AuthenticatorStep.resetPassword:
            return CustomScaffold(
              state: state,
              body: ResetPasswordForm(),
            );
          case AuthenticatorStep.confirmResetPassword:
            return CustomScaffold(
              state: state,
              body: const ConfirmResetPasswordForm(),
            );
          default:
            return null;
        }
      },
      child: child,
    );
  }
}
