import 'package:device_preview/device_preview.dart';
import 'package:disability/features/auth/sign_in/sign_in.dart';
import 'package:disability/features/auth/widgets/forget_password.dart';
import 'package:disability/features/create_request/create_request_screen.dart';
import 'package:disability/features/main_navigation/main_navigation.dart';
import 'package:disability/features/nearby_donors/nearby_donors_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/datasources1/firebase_masseging/firebase_messaging.dart';
import 'firebase_options.dart';

import 'features/splash/splash_screen.dart';
import 'features/onboarding/onboarding.dart';
import 'features/main_navigation/main_navigation.dart';

import 'features/auth/sign_in/sign_in.dart';
import 'features/auth/sign_up/sign_up.dart';
import 'features/auth/cubit/cubit.dart';

import 'features/home/Cubit/home_cubit.dart';
import 'features/profile/cubit/profile_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FCMService().init();

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

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
         '/forgotPassword': (context) => BlocProvider(
    create: (context) => AuthCubit(),
    child: ForgotPasswordScreen(),
  ),

        '/home': (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeCubit()..getData()),
            BlocProvider(create: (context) => ProfileCubit()..getUser()),
          ],
          child: const MainNavigation(),
        ),
      },
    );
  }
}
