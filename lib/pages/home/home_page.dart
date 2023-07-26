import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product_tile.dart';
import 'package:shamo/widgets/banner_card.dart';
import 'package:shamo/widgets/video_card.dart';
import 'package:shamo/widgets/article_card.dart';
import 'package:shamo/widgets/quiz_card.dart';
import 'package:shamo/widgets/lapor_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget header() {
    final User? user = FirebaseAuth.instance.currentUser;

    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo, ${user?.displayName ?? 'Guest'}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
                
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Image.asset(
                  'assets/images/image_profile.png',
                ).image,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget popularProductTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        right: defaultMargin,
        left: defaultMargin,
      ),
      child: Text(
        'Popular Products',
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget bannerProduct() {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: const BannerCard(),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget popularProducts() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
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

  Widget newArrivalsTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        right: defaultMargin,
        left: defaultMargin,
      ),
      child: Text(
        'New Arrivals',
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget newArrivals() {
    return Container(
      margin: const EdgeInsets.only(
        top: 14,
      ),
      child: const Column(children: [
        ProductTile(),
        ProductTile(),
        ProductTile(),
        ProductTile(),
        ProductTile(),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        popularProducts(),
      ],
    );
  }
}
