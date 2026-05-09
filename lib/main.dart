import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

import 'features/splash/splash_screen.dart';
import 'features/onboarding/onboarding.dart';
import 'features/main_navigation/main_navigation.dart';

import 'features/auth/sign_in/sign_in.dart';
import 'features/auth/sign_up/sign_up.dart';
import 'features/auth/cubit/cubit.dart';

import 'features/home/Cubit/home_cubit.dart';

Future<void> main() async {
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
    return MultiBlocProvider(
      providers: [
      
        BlocProvider(
          create: (_) => HomeCubit()..getData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),

        routes: {
          '/onboarding': (context) => const OnboardingScreen(),

          '/signin': (context) => BlocProvider(
                create: (_) => AuthCubit(),
                child: const SignInScreen(),
              ),

          '/signup': (context) => BlocProvider(
                create: (_) => AuthCubit(),
                child: const SignUpScreen(),
              ),

          '/home': (context) => const MainNavigation(),
        },
      ),
    );
  }
}
