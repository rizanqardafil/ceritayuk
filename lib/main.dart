import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shamo/pages/rizan/screens/profile_setup_screen.dart';
import 'package:shamo/pages/quiz/models/game_user.dart';
import 'package:shamo/pages/rizan/providers/auth_provider.dart';
import 'package:shamo/pages/rizan/providers/user_data_provider.dart';

import 'package:shamo/route.dart';
import 'package:get/get.dart';
import 'package:shamo/pages/quiz/providers/questions.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/onboarding/home.dart';

import 'package:shamo/pages/quiz/providers/offline.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              QuestionsProvider(GameUser()), // Provide a GameUser instance
        ),
        ChangeNotifierProvider(
          create: (context) => OfflineProvider(),
        )


       
      ],
      child: GetMaterialApp(
        getPages: appRoutes,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final auth = Provider.of<AuthProvider>(context, listen: false);

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashPage();
            } else if (snapshot.hasData) {
              if (auth.isAuth) {
                return FutureBuilder(
                  future: Provider.of<UserDataProvider>(context, listen: false)
                      .fetchAndSetUserProfileInfo(onlyFetch: true),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SplashPage();
                    } else {
                      return const Home();
                    }
                  },
                );
              } else {
                final isNewUserFuture =
                    Provider.of<AuthProvider>(context, listen: false)
                        .isNewUser();

                return FutureBuilder(
                  future: isNewUserFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SplashPage();
                    } else if (snapshot.hasData) {
                      if (snapshot.data == true) {
                        return const ProfileSetupScreen();
                      } else {
                        return FutureBuilder(
                          future: Provider.of<UserDataProvider>(context,
                                  listen: false)
                              .fetchAndSetUserProfileInfo(onlyFetch: true),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SplashPage();
                            } else {
                              return const Home();
                            }
                          },
                        );
                      }
                    } else {
                      return const Home();
                    }
                  },
                );
              }
            } else {
              return const Home();
            }
          },
        ),
      ),
    );
  }
}
