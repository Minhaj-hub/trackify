import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  Future<void> _onAuthCheckRequested(
      AuthCheckRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(error: e.toString(), errorType: AuthErrorType.login));
    }
  }

  // Login logic
  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated());
    } catch (e) {
      emit(AuthError(error: e.toString(), errorType: AuthErrorType.login));
    }
  }

  // Logout logic
  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    await _auth.signOut();
    emit(AuthInitial());
  }

  // Forgot Password Logic
  Future<void> _onForgotPasswordRequested(
      ForgotPasswordRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _auth.sendPasswordResetEmail(email: event.email);
      emit(AuthPasswordResetEmailSent());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(
          error: e.message ?? 'An unknown error occurred.',
          errorType: AuthErrorType.forgotPassword));
    } catch (e) {
      emit(const AuthError(
          error: 'An unknown error occurred.',
          errorType: AuthErrorType.forgotPassword));
    }
  }
}
