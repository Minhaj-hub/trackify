// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trackify/presentation/screens/dashboard_view_screen.dart';

// import '../../logic/bloc/auth/auth_bloc.dart';
// import '../../logic/bloc/auth/auth_state.dart';
// import '../../logic/commen.dart';
// import 'login_screen.dart';
// import 'dashboard_screen.dart';

// class AuthHandlerScreen extends StatelessWidget {
//   const AuthHandlerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         if (state is AuthLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is AuthAuthenticated) {
//           return const DashboardScreen(
//             body: DashboardViewScreen(),
//             title: 'Dashboard',
//           );
//         } else if (state is AuthUnauthenticated) {
//           return const LoginScreen();
//         } else if (state is AuthError) {
//           // handleAuthError(context, state);
//           ;
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }
