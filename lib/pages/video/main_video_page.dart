import 'package:flutter/material.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/video/home_video_page.dart';
import 'package:shamo/pages/video/screens/my_courses/my_courses.dart';
import 'package:shamo/pages/video/screens/course_library/course_library.dart';

class MainVideoPage extends StatefulWidget {
  const MainVideoPage({Key? key}) : super(key: key);

  @override
  State<MainVideoPage> createState() => _MainVideoPage();
}

class _MainVideoPage extends State<MainVideoPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (currentPage) {
        case 0:
          return const HomeVideoPage();
        case 1:
          return const CourseLibrary();
        case 2:
          return const MyCoursesVideo();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
        backgroundColor: backgroundColor3,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: body());
  }
}
