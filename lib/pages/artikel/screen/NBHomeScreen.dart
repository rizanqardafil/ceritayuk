import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shamo/pages/artikel/component/NBAllNewsComponent.dart';
import 'package:shamo/pages/artikel/component/NBNewsComponent.dart';
import 'package:shamo/pages/artikel/model/NBModel.dart';
import 'package:shamo/pages/artikel/screen/PurchaseMoreScreen.dart';
import 'package:shamo/pages/artikel/utils/NBColors.dart';
import 'package:shamo/pages/artikel/utils/NBDataProviders.dart';
import 'package:shamo/pages/artikel/utils/NBImages.dart';

class NBHomeScreen extends StatefulWidget {
  static String tag = '/NBHomeScreen';

  const NBHomeScreen({super.key});

  @override
  NBHomeScreenState createState() => NBHomeScreenState();
}

class NBHomeScreenState extends State<NBHomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<NBDrawerItemModel> mDrawerList = nbGetDrawerItems();

  List<NBNewsDetailsModel> mNewsList = nbGetNewsDetails();
  List<NBNewsDetailsModel> mTechNewsList = [],
      mFashionNewsList = [],
      mSportsNewsList = [],
      mScienceNewsList = [];

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    tabController = TabController(length: 4, vsync: this);
    for (var element in mNewsList) {
      if (element.categoryName == 'Health and Care') {
        mFashionNewsList.add(element);
      } else if (element.categoryName == 'Sexual Behavior') {
        mSportsNewsList.add(element);
      } else if (element.categoryName == 'Habit Culture') {
        mScienceNewsList.add(element);
      }
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('News Blog', style: boldTextStyle(color: black, size: 20)),
        backgroundColor: white,
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: 'All News'),
            
            Tab(text: 'Health and Care'),
            Tab(text: 'Sexual Behavior'),
            Tab(text: 'Habit Culture')
          ],
          labelStyle: boldTextStyle(),
          labelColor: black,
          unselectedLabelStyle: primaryTextStyle(),
          unselectedLabelColor: grey,
          isScrollable: true,
          indicatorColor: NBPrimaryColor,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130,
              child: DrawerHeader(
                margin: const EdgeInsets.all(0),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 0),
                  leading: const CircleAvatar(
                      backgroundImage: AssetImage(NBProfileImage), radius: 30),
                  title: Text('Robert Fox', style: boldTextStyle()),
                  subtitle: Text('View Profile', style: secondaryTextStyle()),
                  onTap: () {
                    finish(context);
                    PurchaseMoreScreen(true).launch(context);
                  },
                ),
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.all(8),
              separatorBuilder: (_, index) {
                return const Divider();
              },
              itemCount: mDrawerList.length,
              itemBuilder: (_, index) {
                return Text('${mDrawerList[index].title}',
                        style: boldTextStyle())
                    .onTap(() {
                  if (index == 0) {
                    finish(context);
                  } else {
                    finish(context);
                    mDrawerList[index].widget.launch(context);
                  }
                }).paddingAll(8);
              },
            ).expand()
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          NBAllNewsComponent(),
          
          NBNewsComponent(list: mFashionNewsList),
          NBNewsComponent(list: mSportsNewsList),
          NBNewsComponent(list: mScienceNewsList),
        ],
      ),
    );
  }
}
