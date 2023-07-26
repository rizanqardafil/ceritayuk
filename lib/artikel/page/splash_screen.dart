import 'package:flutter/material.dart';
import 'package:shamo/artikel/page/home_screen.dart';
import 'package:shamo/artikel/theme.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff99B7FF),
                Color(0xff6077F7),
              ],
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/splash.png',
              ),
              const SizedBox(
                height: 6,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Learn anything\nAnytime anywhere',
                  textAlign: TextAlign.center,
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Online learning is education that takes\nplace over the internet.',
                textAlign: TextAlign.center,
                style: softpurpleColorTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 210,
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
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                  child: Text(
                    'Start Now',
                    style: whiteTextStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
