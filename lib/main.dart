import 'package:flutter/material.dart';
import 'package:muapp/screens/Announcement_page.dart';
import 'package:muapp/screens/carrer_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muapp/screens/home_screen.dart';
import 'package:muapp/screens/ig_detail_view.dart';
import 'package:muapp/screens/intrest_group_list_page.dart';
import 'package:muapp/screens/lc_card_page.dart';
import 'package:muapp/screens/more_page.dart';
import 'package:provider/provider.dart';

import 'core/notifier/ig_list_notifier.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => ICNotifier()),

      ],
      child: MaterialApp(
        title: 'Mu App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD5C6E7)),
            useMaterial3: true,
            fontFamily: 'Poppins'),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/iglist': (context) => const IntrestGroupListPage(),
          '/lccard': (context) => const LcCardPage(),
          '/announcement': (context) => const AnnouncementPage(),
          '/career': (context) => const CareerPage(),
          '/more': (context) => const MorePage()
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/igDetail') {
            final args = settings.arguments
                as Map<String, dynamic>; // Expecting an integer ID
            final int id = args['id']; // Correctly extracting the integer ID
            return MaterialPageRoute(
              builder: (context) {
                return IgDetailPage(id: id);
              },
            );
          }
          // Handle other routes or throw error
          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
      ),
    return MaterialApp(
      title: 'Mu App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD5C6E7)),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/iglist': (context) => const IntrestGroupListPage(),
        '/lccard': (context) => const LcCardPage()
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/igDetail') {
          final args = settings.arguments
              as Map<String, dynamic>; // Expecting an integer ID
          final int id = args['id']; // Correctly extracting the integer ID
          return MaterialPageRoute(
            builder: (context) {
              return IgDetailPage(id: id);
            },
          );
        }
        // Handle other routes or throw error
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
