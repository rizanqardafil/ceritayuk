import 'package:flutter/material.dart';
import 'package:shamo/artikel/page/detail_screen.dart';
import 'package:shamo/artikel/theme.dart';

class SubjectItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const SubjectItem({super.key, required this.name, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: 170,
          width: 160,
          color: whiteColor,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  imageUrl,
                  width: 80,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: ' $name',
                        style: blackTextStyle.copyWith(fontSize: 14))
                  ]),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: ' 10/month',
                          style: regularTextStyle.copyWith(fontSize: 14))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
                  const Align(alignment: Alignment.center, child: Text('4.5'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
