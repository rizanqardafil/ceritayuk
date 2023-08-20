import 'package:shamo/pages/quiz/screens/finish_level_screen.dart';
import 'package:shamo/pages/quiz/screens/game_screen.dart';
import 'package:shamo/pages/quiz/screens/home/home.dart';
import 'package:shamo/pages/quiz/screens/levels_screen.dart';
import 'package:shamo/pages/quiz/screens/multiplayer_search_screen.dart';
import 'package:shamo/pages/quiz/screens/offline_game_screen.dart';
import 'package:shamo/pages/quiz/screens/offline_multiplayer_result_screen.dart';
import 'package:shamo/pages/quiz/screens/offline_multiplayer_screen.dart';
import 'package:shamo/pages/quiz/screens/online_finish_screen.dart';
import 'package:shamo/pages/quiz/screens/settings/settings_screen.dart';
import 'package:shamo/pages/quiz/screens/leaderboard_screen.dart';

//beranda
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/welcome/Screens/Welcome/welcome_screen.dart';
import 'package:shamo/welcome/Screens/Login/login_screen.dart';
import 'package:shamo/pages/LoginSignup/signup/signup_screen.dart';
import 'package:shamo/onboarding/home.dart';
//chat
import 'package:shamo/pages/chat/pages/chatterScreen.dart';
import 'package:shamo/pages/rizan/screens/main_screen.dart';
import 'package:shamo/pages/rizan/screens/new_chat_screen.dart';
import 'package:shamo/pages/rizan/screens/auth_type_screen.dart';
import 'package:shamo/pages/rizan/screens/auth_screen.dart';
import 'package:shamo/pages/rizan/screens/opt_screen.dart';
import 'package:shamo/pages/rizan/screens/profile_setup_screen.dart';
import 'package:shamo/pages/rizan/screens/privacy_policy_screen.dart';
import 'package:shamo/pages/rizan/screens/message_screen.dart';
import 'package:shamo/pages/rizan/screens/profile_screen.dart';
import 'package:shamo/pages/rizan/screens/manage_users_screen.dart';
import 'package:shamo/pages/rizan/screens/live_chat_message_screen.dart';

//news

import 'package:shamo/pages/news/view/screens/home_page.dart';
//video

class AppRoute {
  const AppRoute._();

  //beranda
  static const home = '/home';
  static const signin = '/signin';
  static const welcome = '/welcome';
  static const signup = '/signup';
  static const onboarding = '/onboarding';

  //chat
  static const chat = MainScreen.routeName;

  //video
  static const video = '/video';

  //news
  static const article = '/articles';

  //quiz
  static const homequiz = '/quiz';
  static const leaderboard = '/leaderboard';
  static const multiplayerSearch = '/multiplayer-search';
  static const game = '/game';
  static const levels = '/levels';
  static const offlineGame = '/offline-game';
  static const finishLevel = '/finish-Level';
  static const onlineFinish = '/online-finish';
  static const settings = '/settings';
  static const offlineMultiplayer = '/offline_multiplayer';
  static const offlineMultiplayerResult = '/offline-multiplayer-resutl';

  static final routes = {
    //beranda
    home: (context) => const MainPage(),
    welcome: (context) => WelcomeScreen1(),
    signin: (context) => const SignInScreen(),
    signup: (context) => const SignUpScreen(),
    onboarding: (context) => const Home(),

    //chat
    chat: (context) => const MainScreen(),

    //artikel
    article: (context) => HomePage(),
    //video
    
    //quiz
    homequiz: (context) => const HomeQuiz(),
    leaderboard: (context) => const LeaderboardScreen(),
    multiplayerSearch: (context) => const MultiplayerSearchScreen(),
    game: (context) => const GameScreen(),
    offlineGame: (context) => const OfflineGameScreen(),
    levels: (context) => const LevelsScreen(),
    finishLevel: (context) => const FinishLevelScreen(),

    onlineFinish: (context) => const OnlineFinishScreen(),
    settings: (context) => const SettingsScreen(),
    offlineMultiplayer: (context) => const OfflineMultiplayerScreen(),
    offlineMultiplayerResult: (context) =>
        const OfflineMultiplayerResultScreen(),
  };
}
