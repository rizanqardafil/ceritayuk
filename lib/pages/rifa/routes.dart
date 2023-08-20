import 'package:shamo/pages/rifa/about/about.dart';
import 'package:shamo/pages/rifa/profile/profile.dart';
import 'package:shamo/pages/rifa/login/login.dart';
import 'package:shamo/pages/rifa/topics/topics.dart';
import 'package:shamo/pages/rifa/home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
