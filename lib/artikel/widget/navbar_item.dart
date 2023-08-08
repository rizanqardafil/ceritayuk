import 'package:flutter/material.dart';
import 'package:shamo/artikel/theme.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final String name;

  const BottomNavbarItem({
    Key? key,
    required this.imageUrl, 
    required this.name,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        const Spacer(),
        Text(
          name,
        ),
        const Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: orangeColor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(900)),
                ),
              )
            : Container(),
      ],
    );
  }
}
