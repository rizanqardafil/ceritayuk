import 'package:flutter/material.dart';
import 'package:shamo/videoo/screens/home/components/trending_course.dart';
import 'package:shamo/videoo/screens/course_library/components/course_list_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/videoo/screens/authentication/initial_auth.dart';
import 'package:shamo/pages/video/screens/course_library/course_library.dart';
import 'dart:convert';

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
          builder: (context) => const InitialAuthentication(),
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40.0),
            const TitleText(
              titleText: "Video Learning",
              backgroundColor: Colors.blue,
            ),

            CourseListTile(
              imageURL: "assets/images/courses.png",
              title: "Courses",
              description: "",
              buttonText: "List Courses",
              isAlreadyEnrolled: false,
              isMyCourseSection: false,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      backgroundColor: backgroundColor0,
                      body: const CourseLibrary(),
                    ),
                  ),
                );
              },
              isInfo: false,
              onInfo: () {},
            ),
            const TitleText(titleText: "All Course"),
            Expanded(
              child: FutureBuilder(
                
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/jsons/course_mapping.json'),
                builder: (context, snapshot) {
                  var decodedJsonData = json.decode(snapshot.data.toString());
                  if (decodedJsonData == null) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text(
                          "Loading",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                      ],
                    );
                  } else {
                    int totalCourses = decodedJsonData["totalCourses"];
                    return ListView.builder(
                      itemCount: totalCourses,
                      itemBuilder: ((context, index) {
                        dynamic courseDataContent =
                            decodedJsonData["course${index + 1}"];
                        String courseId = courseDataContent["id"];
                        String courseName = courseDataContent["name"];
                        String description = courseDataContent["description"];
                        String image = courseDataContent["imageUrl"];
                        int totalTests = courseDataContent["totalTest"];
                        String fileName = courseDataContent["fileName"];
                        return CourseListTile(
                          imageURL: image,
                          title: courseName,
                          description: description,
                          buttonText: "ENROLL",
                          isAlreadyEnrolled: false,
                          isMyCourseSection: false,
                          isInfo: false,
                          onPressed: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            SnackBar? snackBar;
                            List<String>? enrolledCourses =
                                preferences.getStringList("enrolledCourses");
                            if (enrolledCourses == null) {
                              preferences
                                  .setStringList("enrolledCourses", [courseId]);
                              List<String> courseDataToBeStored = [
                                "0",
                                fileName
                              ];
                              print("TotalTest: $totalTests");
                              for (int i = 0; i < totalTests; i++) {
                                courseDataToBeStored.add("test${i + 1}");
                                courseDataToBeStored.add("false");
                              }
                              print("ListContent: $courseDataToBeStored");
                              print("Libraray: $courseId");
                              preferences.setStringList(
                                  courseId, courseDataToBeStored);
                              snackBar = const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Successfully Enrolled"),
                                duration: Duration(seconds: 1),
                              );
                            } else {
                              for (int i = 0; i < enrolledCourses.length; i++) {
                                if (enrolledCourses[i] == courseId) {
                                  snackBar = const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("Already Enrolled"),
                                    duration: Duration(seconds: 1),
                                  );
                                  break;
                                } else {
                                  Set<String> tempList = {
                                    ...enrolledCourses,
                                    courseId
                                  };
                                  List<String> convertedList =
                                      tempList.toList();
                                  preferences.setStringList(
                                      'enrolledCourses', convertedList);
                                  snackBar = const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("Successfully Enrolled"),
                                    duration: Duration(seconds: 1),
                                  );
                                  List<String> courseDataToBeStored = [
                                    "0",
                                    fileName
                                  ];
                                  print("TotalTest: $totalTests");
                                  for (int i = 0; i < totalTests; i++) {
                                    courseDataToBeStored.add("test${i + 1}");
                                    courseDataToBeStored.add("false");
                                  }
                                  print("ListContent: $courseDataToBeStored");
                                  print("Libraray: $courseId");
                                  preferences.setStringList(
                                      courseId, courseDataToBeStored);
                                }
                              }
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar!);
                          },
                          onInfo: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            preferences.remove("enrolledCourses");
                            preferences.remove(courseId);
                          },
                        );
                      }),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({Key? key, required this.titleText, this.backgroundColor})
      : super(key: key);
  final String titleText;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor3,
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      child: Text(
        titleText,
        style: primaryTextStyle.copyWith(
            fontSize: 22, fontWeight: semiBold, color: Colors.black),
      ),
    );
  }
}
