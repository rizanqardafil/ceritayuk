import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  Widget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: const Text('Favorite Shoes'),
      // elevation: 0,
    );
  }

  Widget emptyWishlist() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_love.png',
              width: 74,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              ' You don\'t have dream shoes?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: subtitleTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Explore Store',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Expanded(
      child: ListView(
        children: const [
          WishlistCard(),
          WishlistCard(),
          WishlistCard(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        // emptyWishlist(),
        content(),
      ],
    );
  }
}
