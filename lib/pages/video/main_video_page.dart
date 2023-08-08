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
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/chat');
        },
        child: Image.asset(
          'assets/images/icon_chat.png',
          width: 20,
        ),
      );
    }

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

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: backgroundColor4,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentPage,
              onTap: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/images/icon_home.png',
                      width: 21,
                      color: currentPage == 0 ? primaryColor : thirdColor,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/images/icon_wishlist.png',
                      width: 20,
                      color: currentPage == 1 ? primaryColor : thirdColor,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/images/icon_chat.png',
                      width: 20,
                      color: currentPage == 2 ? primaryColor : thirdColor,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/images/icon_profile.png',
                      width: 18,
                      color: currentPage == 3 ? primaryColor : thirdColor,
                    ),
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor3,
        floatingActionButton: cartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customBottomNav(),
        body: body());
  }
}
