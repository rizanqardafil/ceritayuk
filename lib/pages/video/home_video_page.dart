import 'package:flutter/material.dart';
import 'package:shamo/videoo/screens/home/components/trending_course.dart';
import 'package:shamo/videoo/screens/course_library/components/course_list_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/videoo/screens/authentication/initial_auth.dart';
import 'package:shamo/pages/video/screens/my_courses/my_courses.dart';
class HomeVideoPage extends StatefulWidget {
  const HomeVideoPage({Key? key}) : super(key: key);

  @override
  State<HomeVideoPage> createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideoPage> {
  String name = "";

  loadNameFromSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? nameLocal = preferences.getString("name");
    if (nameLocal == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InitialAuthentication(),
        ),
      );
    } else {
      setState(() {
        name = nameLocal;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor4,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 35.0),
            const TitleText(titleText: "Video Learning"),
            CourseTrending(
              onPressed: () {
                print("Course Button is Pressed");
              },
              isNew: true,
              imagePath: "assets/images/react.jpg",
              title: "Zero to Hero React Js Course",
              isPremium: true,
            ),
            const TitleText(titleText: "Start Learning"),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  CourseListTile(
                    imageURL: "assets/images/logo.png",
                    title: "My Courses",
                    description:
                        "Work Hard, Develop Skills and Solve Problems.",
                    buttonText: "My COURSES",
                    isAlreadyEnrolled: false,
                    isMyCourseSection: false,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            backgroundColor: backgroundColor0,
                           body: MyCoursesVideo(),
                          ),
                        ),
                      );
                    },
                    isInfo: false,
                    onInfo: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.titleText,
  }) : super(key: key);
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      child: Text(
        titleText,
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}
