import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shamo/pages/artikel/model/NBModel.dart';
import 'package:shamo/pages/artikel/utils/NBDataProviders.dart';
import 'package:shamo/pages/artikel/utils/NBImages.dart';
import 'package:shamo/pages/artikel/utils/NBWidgets.dart';
import 'package:shamo/pages/artikel/utils/NBAppWidget.dart';

class NBSettingScreen extends StatefulWidget {
  static String tag = '/NBSettingScreen';

  @override
  NBSettingScreenState createState() => NBSettingScreenState();
}

class NBSettingScreenState extends State<NBSettingScreen> {
  List<NBSettingsItemModel> mSettingList = nbGetSettingItems();
  NBLanguageItemModel? result = NBLanguageItemModel(NBEnglishFlag, 'English');

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  gotoNext(int index) async {
    result = await mSettingList[index].widget.launch(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nbAppBarWidget(context, title: 'Setting'),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, index) {
          return Divider();
        },
        itemCount: mSettingList.length,
        itemBuilder: (_, index) {
          return Row(
            children: [
              Text('${mSettingList[index].title}', style: primaryTextStyle()).expand(),
              index == 0
                  ? Row(
                      children: [
                        commonCacheImageWidget('${result!.image}', 30),
                        8.width,
                        Text('${result!.name}', style: primaryTextStyle()),
                        Icon(Icons.navigate_next).paddingAll(8),
                      ],
                    )
                  : Icon(Icons.navigate_next).paddingAll(8),
            ],
          ).onTap(() {
            if (index == 4 || index == 5) {
              launchURL('https://www.google.com/');
            } else {
              mSettingList[index].widget.launch(context);
            }
          });
        },
      ),
    );
  }
}
