import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:shamo/pages/cart_page.dart';
import 'package:shamo/pages/checkout_page.dart';
import 'package:shamo/pages/edit_profile_page.dart';
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/news/screens/discover_screen.dart';
import 'package:shamo/pages/quiz/controllers/controllers.dart';
import 'package:shamo/pages/quiz/screens/screens.dart';
import 'package:shamo/welcome/Screens/Login/login_screen.dart';
import 'package:shamo/pages/LoginSignup/signup/signup_screen.dart';
import 'package:shamo/welcome/Screens/Welcome/welcome_screen.dart';
import 'package:shamo/onboarding/home.dart';
import 'package:shamo/pages/video/main_video_page.dart';
import 'package:shamo/pages/chat/pages/chatterScreen.dart';
import 'package:shamo/quiz/screens/spalsh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeritaYuk',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const MainPage(),
        '/onboarding': (context) => const Home(),
        '/welcome': (context) => WelcomeScreen1(),
        '/sign-in': (context) => const SignInScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/detail-chat': (context) => const ChatterScreen(),
        '/video': (context) => const MainVideoPage(),
        '/news': (context) => const HomeScreen(),
        '/discovered': (context) => const DiscoverScreen(),
        '/quiz': (context) => const SplashScreenQuiz(),
        '/quizscreen': (context) {
          Get.put(QuizController());
          return const QuizeScreen();
        },
        '/answercheck': (context) => const AnswersCheckScreen(),
        '/quizeoverview': (context) => const QuizOverviewScreen(),
        '/resultscreen': (context) => const Resultcreen(),
        '/edit-profile': (context) => const EditProfilePage(),
        '/product': (context) => const ProductPage(),
        '/cart': (context) => const CartPage(),
        '/checkout': (context) => const CheckoutPage(),
      },
    );
  }
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    name: 'cerita',
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
