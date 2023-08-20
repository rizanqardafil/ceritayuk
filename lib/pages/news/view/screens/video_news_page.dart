import 'package:flutter/material.dart';
import 'package:shamo/pages/news/model/core/video_news.dart';
import 'package:shamo/pages/news/model/helper/video_news_helper.dart';
import 'package:shamo/pages/news/view/widgets/custom_app_bar.dart';
import 'package:shamo/pages/news/view/widgets/video_news_card.dart';
import 'package:shamo/pages/news/view/widgets/video_news_filter_sheet.dart';

class VideoNewsPage extends StatefulWidget {
  const VideoNewsPage({super.key});

  @override
  _VideoNewsPageState createState() => _VideoNewsPageState();
}

class _VideoNewsPageState extends State<VideoNewsPage>
    with TickerProviderStateMixin {
  List<VideoNews> videoNews = VideoNewsHelper.videoNews;
  late TabController _categoryTabController;

  @override
  void initState() {
    super.initState();
    _categoryTabController = TabController(length: 7, vsync: this);
  }

  _changeTab(index) {
    setState(() {
      _categoryTabController.index = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _categoryTabController.dispose();
  }

  showFilter() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return VideoNewsFilterSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressedLeading: () {
          Navigator.of(context).pop();
        },
        title: const Text(
          'Video News',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showFilter();
            },
            icon: const Icon(
              Icons.sort_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              isScrollable: true,
              controller: _categoryTabController,
              labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'inter'),
              labelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'inter'),
              unselectedLabelColor: Colors.black.withOpacity(0.6),
              indicatorColor: Colors.transparent,
              onTap: _changeTab,
              tabs: const [
                Tab(
                  text: 'All categories',
                ),
                Tab(
                  text: 'Covid19',
                ),
                Tab(
                  text: 'International',
                ),
                Tab(
                  text: 'Europe',
                ),
                Tab(
                  text: 'American',
                ),
                Tab(
                  text: 'Asian',
                ),
                Tab(
                  text: 'Sexual Behavior',
                ),
              ],
            ),
            IndexedStack(
              index: _categoryTabController.index,
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  childAspectRatio:
                      VideoNewsCard.itemWidth / VideoNewsCard.itemHeight,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 10,
                  children: List.generate(videoNews.length, (index) {
                    return VideoNewsCard(
                      data: videoNews[index],
                    );
                  }),
                ),
                SizedBox(
                  child: Center(
                      child: Text(
                          'category page ${_categoryTabController.index}')),
                ),
                SizedBox(
                  child: Center(
                      child: Text(
                          'category page ${_categoryTabController.index}')),
                ),
                SizedBox(
                  child: Center(
                      child: Text(
                          'category page ${_categoryTabController.index}')),
                ),
                SizedBox(
                  child: Center(
                      child: Text(
                          'category page ${_categoryTabController.index}')),
                ),
                SizedBox(
                  child: Center(
                      child: Text(
                          'category page ${_categoryTabController.index}')),
                ),
                SizedBox(
                  child: Center(
                      child: Text(
                          'category page ${_categoryTabController.index}')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
