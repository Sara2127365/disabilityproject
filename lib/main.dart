import 'package:disability/features/auth/sign_in/sign_in.dart';
import 'package:disability/features/create_request/create_request_screen.dart';
import 'package:disability/features/main_navigation/main_navigation.dart';
import 'package:disability/features/nearby_donors/nearby_donors_screen.dart';
import 'package:disability/features/profile/cubit/profile_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/cubit/cubit.dart';
import 'features/auth/sign_up/sign_up.dart';
import 'features/home/home_screen.dart';
import 'features/onboarding/onboarding.dart';
import 'features/splash/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),

      routes: {
        '/onboarding': (context) => const OnboardingScreen(),

        '/signin': (context) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignInScreen(),
        ),

        '/signup': (context) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignUpScreen(),
        ),

        '/home': (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ProfileCubit()..getUser()),
          ],
          child: const MainNavigation(),
        ),
      },
    );
  }
}
