import 'package:flutter/material.dart';
import 'package:shamo/news/view/screens/bookmarks_page.dart';
import 'package:shamo/news/view/screens/home_page.dart';
import 'package:shamo/news/view/screens/discover_page.dart';
import 'package:shamo/news/view/widgets/custom_bottom_navigation_bar.dart';

class PageSwitchWithAnimation extends StatefulWidget {
  const PageSwitchWithAnimation({super.key});

  @override
  _PageSwitchWithAnimationState createState() =>
      _PageSwitchWithAnimationState();
}

class _PageSwitchWithAnimationState extends State<PageSwitchWithAnimation> {
  int _selectedIndex = 0;
  late PageController _pageSwitchController;

  @override
  void initState() {
    super.initState();
    _pageSwitchController = PageController();
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageSwitchController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageSwitchController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomePage(),
          const DiscoverPage(),
          const BookmarkPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
