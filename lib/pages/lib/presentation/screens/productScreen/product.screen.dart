import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/lib/app/constants/app.assets.dart';
import 'package:shamo/pages/lib/app/constants/app.colors.dart';
import 'package:shamo/pages/lib/core/notifiers/product.notifier.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/pages/beranda/core/notifiers/user.notifier.dart';
import 'package:shamo/pages/lib/presentation/screens/productScreen/widgets/brands.widget.dart';
import 'package:shamo/pages/lib/presentation/screens/productScreen/widgets/recommended.widget.dart';
import 'package:shamo/pages/lib/presentation/widgets/shimmer.effects.dart';
import 'package:shamo/pages/lib/presentation/widgets/custom.text.style.dart';
import 'package:shamo/pages/lib/presentation/widgets/dimensions.widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;

    UserNotifier userData = Provider.of<UserNotifier>(context);
    var userName = userData.getUserName ?? ' ';
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi , $userName',
                      style: CustomTextWidget.bodyTextB1(
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                      ),
                    ),
                    vSizedBox1,
                    Text(
                      'What Would You Like To Wear Today ??',
                      style: CustomTextWidget.bodyText3(
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                      ),
                    ),
                    vSizedBox2,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppColors.rawSienna,
                            AppColors.mediumPurple,
                            AppColors.fuchsiaPink,
                          ],
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.23,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 5, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pamper Your Feet ',
                              style: CustomTextWidget.bodyTextB2(
                                  color: AppColors.creamColor),
                            ),
                            Text(
                              'With our shoes',
                              style: CustomTextWidget.bodyTextB3(
                                  color: AppColors.creamColor),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.creamColor,
                                    enableFeedback: true,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 2,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Check',
                                    style: CustomTextWidget.bodyText3(
                                      color: AppColors.mirage,
                                    ),
                                  ),
                                ),
                                hSizedBox2,
                                SizedBox(
                                  height: 115,
                                  width: 180,
                                  child: Image.asset(AppAssets.homeJordan),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    vSizedBox2,
                    const BrandWidget(),
                    vSizedBox2,
                    Text(
                      'Exclusive Shoes',
                      style: CustomTextWidget.bodyTextB2(
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                      ),
                    ),
                    vSizedBox1,
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Consumer<ProductNotifier>(
                        builder: (context, notifier, _) {
                          return FutureBuilder(
                            future: notifier.fetchProducts(context: context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return ShimmerEffects.loadShimmer(
                                    context: context);
                              } else if (!snapshot.hasData) {
                                return Center(
                                  child: Text(
                                    'Some Error Occurred...',
                                    style: CustomTextWidget.bodyTextUltra(
                                      color: themeFlag
                                          ? AppColors.creamColor
                                          : AppColors.mirage,
                                    ),
                                  ),
                                );
                              } else {
                                return productForYou(
                                  snapshot: snapshot,
                                  themeFlag: themeFlag,
                                  context: context,
                                );
                              }
                            },
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
