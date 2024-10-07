import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackify/logic/bloc/auth/auth_bloc.dart';
import 'package:trackify/logic/bloc/auth/auth_state.dart';
import 'package:trackify/presentation/screens/dashboard_screen.dart';
import 'package:trackify/presentation/screens/dashboard_view_screen.dart';
import 'package:trackify/presentation/screens/forget_password_screen.dart';

import '../../logic/bloc/auth/auth_event.dart';
import '../../logic/commen.dart';
import '../../utils/colors.dart';
import '../../utils/string.dart';
import '../widgets/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

// listener: (context, state) {
//           if (state is AuthAuthenticated) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const DashboardScreen()),
//             );
//           } else if (state is AuthError) {
//             ScaffoldMessenger.of(context)
//               ..hideCurrentSnackBar()
//               ..showSnackBar(SnackBar(content: Text(state.error)));
//           }
//         },

  bool? remeberMe = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const DashboardScreen(
                    body: DashboardViewScreen(), title: 'Dashboard')),
          );
        } else if (state is AuthError) {
          handleAuthError(context, state);
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 35.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                height: 100,
              ),
              CSizedBox(
                height: 40.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CTextFormField(
                      controller: _emailController,
                      labelName: 'Enter Your Email',
                      prefixIcon: Icons.email,
                    ),
                    CSizedBox(
                      height: 20.h,
                    ),
                    CTextFormField(
                      controller: _passwordController,
                      labelName: 'Enter Your Password',
                      prefixIcon: Icons.lock,
                    ),
                    CSizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: remeberMe,
                            onChanged: (value) {
                              setState(() {
                                remeberMe = value;
                              });
                            }),
                        CSizedBox(
                          width: 10.h,
                        ),
                        const Text('Remeber Me')
                      ],
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return state is AuthLoading
                            ? const CircularProgressIndicator()
                            : CElevatedBtn(
                                txt: 'Log in',
                                onPressed: () {
                                  final email = _emailController.text;
                                  final password = _passwordController.text;
                                  context.read<AuthBloc>().add(LoginRequested(
                                      email: email, password: password));
                                },
                              );
                      },
                    ),
                    CSizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ForgetPasswordScreen();
                        }));
                      },
                      child: const CText(
                        txt: 'Forget Password?',
                        color: linkBlue,
                      ),
                    ),
                    CSizedBox(
                      height: 20.h,
                    ),
                    Image.asset(
                        // width: screenWidth - 10,
                        height: screenHeight / 4,
                        deliveryBoyImage)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
