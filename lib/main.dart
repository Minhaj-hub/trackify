import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackify/presentation/screens/dashboard_view_screen.dart';
import 'package:trackify/utils/colors.dart';

import 'firebase_options.dart';
import 'logic/bloc/auth/auth_bloc.dart';
import 'presentation/screens/dashboard_screen.dart';
import 'presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: scaffolBgClr,
              colorScheme: ColorScheme.fromSeed(seedColor: whiteClr),
              useMaterial3: true,
            ),
            home: StreamBuilder<User?>(
              stream: auth.authStateChanges(),
              builder: (context, snapshot) {
                // Check if the user is authenticated
                if (snapshot.connectionState == ConnectionState.active) {
                  final user = snapshot.data;
                  // If the user is logged in, navigate to the Dashboard
                  if (user != null) {
                    return const DashboardScreen(
                      body: DashboardViewScreen(),
                      title: 'Dashboard',
                    );
                  }
                  // If the user is not logged in, show the Login screen
                  return const LoginScreen();
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        );
      },
    );
  }
}
