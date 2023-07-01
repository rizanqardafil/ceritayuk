import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product_card.dart';
import 'package:shamo/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget header() {
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
                  'Hallo, Alex',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '@alexkein',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: subtitleTextStyle.copyWith(
                    fontSize: 16,
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

  Widget categories() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: defaultMargin),
            categoriesItem('All Shoes', true),
            categoriesItem('Running', false),
            categoriesItem('Training', false),
            categoriesItem('Basketball', false),
            categoriesItem('Hiking', false),
            const SizedBox(width: 14),
          ],
        ),
      ),
    );
  }

  Widget categoriesItem(String category, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(
        right: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: isSelected ? transparentColor : subtitleColor),
        color: isSelected ? primaryColor : transparentColor,
      ),
      child: Text(
        category,
        style: primaryTextStyle.copyWith(
          color: isSelected ? primaryTextColor : subtitleColor,
          fontSize: 13,
          fontWeight: medium,
        ),
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

  Widget popularProducts() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: defaultMargin,
            ),
            const ProductCard(),
            const ProductCard(),
            const ProductCard(),
          ],
        ),
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
      child: Column(children: const [
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
        categories(),
        popularProductTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
