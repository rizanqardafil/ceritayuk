import 'package:flutter/material.dart';
import 'package:shamo/artikel/theme.dart';
import 'package:shamo/artikel/widget/subject_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFFFBFB),
                Color(0xffEEEEEE),
              ],
            ),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: edge,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rizan",
                          style: regularTextStyle.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Find your Article",
                          style: blackTextStyle.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/btn_search.png',
                      width: 43,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff99B7FF),
                      Color(0xff6077F7),
                    ],
                  ),
                  color: Colors.purple[900],
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '70% off',
                            style: whiteTextStyle.copyWith(
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Mar 30 - Apr 5',
                            style: whiteTextStyle.copyWith(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xffFE876C),
                                  Color(0xffFD5D37),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Join Now',
                                style: whiteTextStyle.copyWith(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/course.png',
                            width: 130,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //Subject
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Subject',
                        style: blackTextStyle.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'See all',
                        style: softpurpleColorTextStyle.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubjectItem(
                      name: 'Mathematics',
                      imageUrl: 'assets/images/pic1.png',
                    ),
                    SubjectItem(
                      name: 'Mathematics',
                      imageUrl: 'assets/images/pic1.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubjectItem(
                      name: 'Fisika',
                      imageUrl: 'assets/images/pic3.png',
                    ),
                    SubjectItem(
                      name: 'Olahraga',
                      imageUrl: 'assets/images/pic4.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
