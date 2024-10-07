import 'package:flutter/material.dart';

import 'bloc/auth/auth_state.dart';

void handleAuthError(BuildContext context, AuthError state) {
  String errorMessage;

  // Determine the error type
  if (state.errorType == AuthErrorType.login) {
    errorMessage = 'Incorrect credentials. Please try again.';
  } else if (state.errorType == AuthErrorType.forgotPassword) {
    errorMessage =
        'Error sending password reset email. Please check your email.';
  } else {
    errorMessage = 'An unknown error occurred.';
  }

  // Show the error message in a SnackBar
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(errorMessage)));
}
