import 'package:flutter/material.dart';

import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  //* initialise a var for selected index
  int selectedIndex = 0;

  //* list of all screens available
  final _screens = [
    HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text("Explore"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Add"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Subscriptions"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Library"),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Navigation Stack to hold memory of the state when switched to diff page
      body: Stack(
        children: _screens
            .asMap()
            .map(
              (i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: selectedIndex != i,
                  child: screen,
                ),
              ),
            )
            .values
            .toList(),
      ),

      //* Bottom Navigation Bar starts from here,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          currentIndex: selectedIndex,
          onTap: (value) => setState(() {
                selectedIndex = value;
              }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: "Explore",
              activeIcon: Icon(Icons.explore),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: "Add",
              activeIcon: Icon(Icons.add_circle),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: "Subscriptions",
              activeIcon: Icon(Icons.subscriptions),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: "Library",
              activeIcon: Icon(Icons.video_library),
            ),
          ]),
    );
  }
}
