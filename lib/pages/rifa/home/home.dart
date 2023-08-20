import 'package:flutter/material.dart';
import 'package:shamo/pages/rifa/login/login.dart';
import 'package:shamo/pages/rifa/services/auth.dart';
import 'package:shamo/pages/rifa/shared/shared.dart';
import 'package:shamo/pages/rifa/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorMessage(),
          );
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
