import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackify/presentation/screens/login_screen.dart';
import 'package:trackify/presentation/widgets/custom_widgets.dart';

import '../../logic/bloc/auth/auth_bloc.dart';
import '../../logic/bloc/auth/auth_event.dart';
import '../../logic/bloc/auth/auth_state.dart';
import '../../logic/commen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CText(
              txt: 'Forget Password?',
              fontSize: 16.sp,
              weight: FontWeight.bold,
            ),
            CSizedBox(
              height: 10.h,
            ),
            const CText(
                txt:
                    'Enter your email and we\'ll send you instructions to reset your password'),
            CSizedBox(
              height: 20.h,
            ),
            const CText(txt: 'Email'),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0.h)),
            ),
            CSizedBox(
              height: 25.h,
            ),
            CElevatedBtn(
              txt: 'Submit',
              onPressed: () {
                // Trigger ForgotPasswordRequested event
                context.read<AuthBloc>().add(
                      ForgotPasswordRequested(
                          email: _emailController.text.trim()),
                    );
              },
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthPasswordResetEmailSent) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Password reset email sent!'),
                    ),
                  );

                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()));
                  });
                } else if (state is AuthError) {
                  handleAuthError(context, state);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
