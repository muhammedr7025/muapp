import 'package:flutter/material.dart';
import 'package:muapp/screens/ig_detail_view.dart';
import 'package:muapp/screens/intrest_group_list_page.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pages = [
    const IntrestGroupListPage(),
    const IgDetailPage(id: 0),
    Container(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: ResponsiveNavigationBar(
        backgroundColor: Color(0xFF9674c0),
        selectedIndex: _selectedIndex,
        onTabChange: changeTab,
        // showActiveButtonText: false,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        navigationBarButtons: const <NavigationBarButton>[
          NavigationBarButton(
              text: 'IG', icon: Icons.home, backgroundColor: Color(0xFF5a2b91)),
          NavigationBarButton(
            text: 'Notification',
            icon: Icons.star,
            backgroundColor: Color(0xFF5a2b91),
          ),
          NavigationBarButton(
            text: 'Careers',
            icon: Icons.settings,
            backgroundColor: Color(0xFF5a2b91),
          ),
          NavigationBarButton(
            text: 'More',
            icon: Icons.settings,
            backgroundColor: Color(0xFF5a2b91),
          ),
        ],
      ),
    );
  }
}
