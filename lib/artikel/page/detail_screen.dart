import 'package:flutter/material.dart';
import 'package:shamo/artikel/theme.dart';
import 'package:shamo/artikel/widget/outline_item.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: 107,
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFD9E88),
                          Color(0xffFE6540),
                        ],
                      ),
                      color: Colors.purple[900],
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sains',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 30,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/star.png',
                                      width: 20,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      ' 3.5 (140 Reviews)',
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 90,
                                width: 92,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffFDB63B),
                                      Color(0xffFDB747),
                                    ],
                                  ),
                                  color: Colors.purple[900],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                  border:
                                      Border.all(width: 1, color: whiteColor),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: const Color(0xffFDB63B)
                                          .withOpacity(0.8),
                                      blurRadius: 3,
                                      offset: const Offset(0, 2),
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 11,
                                    ),
                                    Text(
                                      'Fee',
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'IDR 22',
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 22),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/book.png',
                    width: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Outline',
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
                            style:
                                softpurpleColorTextStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlineItem(
                        imageUrl: 'assets/images/img.png',
                        name: 'Order of Operation',
                        time: '17.11 min',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/img-1.png',
                        name: 'Sin, Cos, Tangen',
                        time: '15.11 min',
                      ),
                    ],
                  ),
                  Container(
                    width: 360,
                    height: 63,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff96B4FF),
                          Color(0xff657CF8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Image.asset(
                            'assets/images/lock.png',
                            width: 43,
                          ),
                        ),
                        TextButton(
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
                            'Unlock Course Now',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                        Image.asset(
                          'assets/images/arrow.png',
                          width: 43,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 30,
                    ),
                  ),
                  Text(
                    ' Details',
                    style: blackTextStyle.copyWith(fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked ? 'assets/images/Heart1.png' : 'assets/images/Heart.png',
                      width: 30,
                    ),
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
