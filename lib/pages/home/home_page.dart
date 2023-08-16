import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/video_card.dart';
import 'package:shamo/widgets/article_card.dart';
import 'package:shamo/widgets/quiz_card.dart';
import 'package:shamo/widgets/lapor_card.dart';
import 'package:shamo/pages/home/datas/user_profile.dart';
import 'package:shamo/pages/home/colors.dart';
import 'package:shamo/pages/home/padding.dart';
import 'package:shamo/pages/home/widgets/clipper.dart';
import 'package:shamo/pages/home/widgets/custom_heading.dart';
import 'package:shamo/pages/home/widgets/custom_search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final User? user = FirebaseAuth.instance.currentUser;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: spacer-40),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                    width: size.width,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: backgroundColor8,
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: appPadding, right: appPadding),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: spacer - 20),
                    //heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomHeading(
                          title: 'Hallo, ${user?.displayName ?? 'Guest'}',
                          subTitle: 'Welcome Back!',
                          color: textWhite,
                        ),
                        SizedBox(
                            height: spacer,
                            width: spacer,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                            )),
                      ],
                    ),
                    const SizedBox(height: spacer - 30),
                    //search
                    const CustomSearchField(
                      hintField: 'Search',
                      backgroundColor: background,
                    ),
                    const SizedBox(height: spacer - 30),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget popularProducts() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: const VideoCard(),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: const ArticleCard(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // Tambahkan jarak di antara baris produk
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: const QuizCard(),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: const LaporCard(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        getBody(),
        popularProducts(),
      ],
    );
  }
}
