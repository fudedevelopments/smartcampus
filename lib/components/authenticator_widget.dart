import 'dart:async';

import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcampus/bloc/userprofile_bloc.dart';
import 'package:smartcampus/components/custom_signin_form.dart';
import 'package:smartcampus/components/custom_signup_form.dart';
import 'package:smartcampus/components/customscaffold.dart';
import 'package:smartcampus/utils/authservices.dart';

class AuthenticatorWidget extends StatefulWidget {
  final Widget child;
  const AuthenticatorWidget({super.key, required this.child});

  @override
  State<AuthenticatorWidget> createState() => _AuthenticatorWidgetState();
}

class _AuthenticatorWidgetState extends State<AuthenticatorWidget> {
  Timer? _authCheckTimer;

  @override
  void initState() {
    super.initState();
    // Check auth state after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthAndTriggerBloc();
    });

    // Set up a timer to periodically check auth state
    _authCheckTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      _checkAuthAndTriggerBloc();
    });
  }

  @override
  void dispose() {
    _authCheckTimer?.cancel();
    super.dispose();
  }

  Future<void> _checkAuthAndTriggerBloc() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (session.isSignedIn) {
        final currentState = BlocProvider.of<UserprofileBloc>(context).state;

        if (currentState is UserprofileInitial) {
          _triggerUserProfileBloc(context);
        }
        _authCheckTimer?.cancel();
        _authCheckTimer = null;
      }
    } catch (e) {
      print('Error checking auth state: $e');
    }
  }

  Future<void> _triggerUserProfileBloc(BuildContext context) async {
    // Fetch user data after sign-in
    AuthService authService = AuthService();
    await authService.fetchIdToken();
    await authService.fetchUserAttributes();

    if (authService.isSignedIn &&
        authService.email != null &&
        authService.sub != null) {
      // Trigger the UserprofileBloc
      BlocProvider.of<UserprofileBloc>(context).add(
        GetUserProfileEvent(
          email: authService.email!,
          userid: authService.sub!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return CustomScaffold(
              state: state,
              body: CustomSignInForm(state: state),
              isStudent: true,
            );
          case AuthenticatorStep.signUp:
            return CustomScaffold(
              state: state,
              body: CustomSignUpForm(state: state),
              isStudent: true,
            );
          case AuthenticatorStep.confirmSignUp:
            return CustomScaffold(
              state: state,
              body: ConfirmSignUpForm(),
              isStudent: true,
            );
          case AuthenticatorStep.resetPassword:
            return CustomScaffold(
              state: state,
              body: ResetPasswordForm(),
              isStudent: true,
            );
          case AuthenticatorStep.confirmResetPassword:
            return CustomScaffold(
              state: state,
              body: const ConfirmResetPasswordForm(),
              isStudent: true,
            );
          default:
            return null;
        }
      },
      child: widget.child,
    );
  }
}
