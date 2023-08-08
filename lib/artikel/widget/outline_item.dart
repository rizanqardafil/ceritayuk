import 'package:flutter/material.dart';
import 'package:shamo/artikel/theme.dart';

class OutlineItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String time;
  const OutlineItem(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: 90,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFFFFFF),
              Color(0xffFFFFFF),
            ],
          ),
          color: Colors.purple[900],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imageUrl,
                width: 63,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        time,
                        style: greyTextStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Image.asset('assets/images/play.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
