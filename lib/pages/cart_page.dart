import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

import '../widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Your Cart',
        ),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_cart3.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Opss! Your Cart is Empty',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: subtitleTextStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Explore Store',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
            ),
          ],
        ),
      );
    }

    Widget listCart() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: const [
          CartCard(),
          CartCard(),
          CartCard(),
          CartCard(),
          CartCard(),
          CartCard(),
        ],
      );
    }

    Widget customButtomNav() {
      return SizedBox(
        height: 150,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$287,68',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
              color: subtitleColor,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Image.asset(
                      'assets/images/icon_next.png',
                      width: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: header(),
      body: listCart(),
      bottomNavigationBar: customButtomNav(),
    );
  }
}
