import 'package:flutter/material.dart';
import 'package:muapp/screens/home_screen.dart';
import 'package:muapp/screens/ig_detail_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mu App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/iglist': (context) => const HomeScreen(),
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
