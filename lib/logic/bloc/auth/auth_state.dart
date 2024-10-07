import 'package:equatable/equatable.dart';

enum AuthErrorType { login, forgotPassword }

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthPasswordResetEmailSent extends AuthState {}

class AuthError extends AuthState {
  final String error;
  final AuthErrorType errorType;

  const AuthError({required this.error, required this.errorType});

  @override
  List<Object> get props => [error, errorType];
}
