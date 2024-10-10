import 'package:flutter/material.dart';
import 'package:muapp/screens/Announcement_page.dart';
import 'package:muapp/screens/carrer_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muapp/screens/Announcement_page.dart';
import 'package:muapp/screens/carrer_page.dart';
import 'package:muapp/screens/ig_detail_view.dart';
import 'package:muapp/screens/intrest_group_list_page.dart';
import 'package:muapp/screens/more_page.dart';
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
    const AnnouncementPage(),
    const CareerPage(),
    const MorePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: ResponsiveNavigationBar(
        backgroundColor: const Color(0xFF9674c0),
        selectedIndex: _selectedIndex,
        onTabChange: changeTab,
        // showActiveButtonText: false,
        textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins-Bold'),

        textStyle: GoogleFonts.poppins(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        navigationBarButtons: const <NavigationBarButton>[
          NavigationBarButton(
              text: 'IG', icon: Icons.home, backgroundColor: Color(0xFF5a2b91)),
          NavigationBarButton(
            text: 'Notification',
            icon: Icons.notifications,
            backgroundColor: Color(0xFF5a2b91),
          ),
          NavigationBarButton(
            text: 'Careers',
            icon: Icons.settings,
            backgroundColor: Color(0xFF5a2b91),
          ),
          NavigationBarButton(
            text: 'More',
            icon: Icons.menu,
            backgroundColor: Color(0xFF5a2b91),
          ),
        ],
      ),
    );
  }
}
