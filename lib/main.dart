import 'package:flutter/material.dart';
import 'package:shamo/pages/cart_page.dart';
import 'package:shamo/pages/checkout_page.dart';
import 'package:shamo/pages/detail_chat_page.dart';
import 'package:shamo/pages/edit_profile_page.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/pages/sign_up_page.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/onboarding/home.dart';
import 'package:shamo/pages/LoginSignup/welcome/welcome_screen.dart';
import 'package:shamo/homepage/mainP.dart';
import 'package:shamo/homepageall/screens/product/products_screen.dart';
// import 'package:shamo/quiz/screen/dashboard.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomeScreen(),
        // '/quiz': (context) => DashboardPage(),
        '/splash0': (context) => const Home(),
        '/sign-in': (context) => const WelcomeScreen(),
        '/sign-up': (context) => const SignUpPage(),
        '/homeall': (context) => const ProductsScreen(),
        // '/home': (context) => const MainPage(),
        '/detail-chat': (context) => const DetailChatPage(),
        '/edit-profile': (context) => const EditProfilePage(),
        '/product': (context) => const ProductPage(),
        '/cart': (context) => const CartPage(),
        '/checkout': (context) => const CheckoutPage(),
      },
    );
  }
}
