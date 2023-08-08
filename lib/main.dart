import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shamo/onboarding/home.dart';
import 'package:shamo/route.dart';
import 'package:shamo/pages/quiz/providers/auth.dart';
import 'package:shamo/pages/quiz/providers/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shamo/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();

  runApp(ProviderScope(
      overrides: [spProvider.overrideWithValue(sharedPreferences)],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final auth = ref.watch(authProvider);
        final futureAuth = ref.watch(futureAuthProvider);
        return MaterialApp(
          title: 'NASA App',
          // home: const WelcomeScreen(),
          home: futureAuth.when(data: (data) {
            return auth.isAuth ? const Home() : const SplashPage();
          }, error: (e, st) {
            return Scaffold(
              body: Center(child: Text(e.toString())),
            );
          }, loading: () {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }),
          routes: AppRoute.routes,
        );
      },
    );
  }
}
