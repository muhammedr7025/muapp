import 'package:flutter/material.dart';

class IntrestGroupListPage extends StatelessWidget {
  const IntrestGroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Interest Group',
        ),
        titleTextStyle: const TextStyle(
            fontSize: 30, fontFamily: 'Roboto-bold', color: Colors.black),
      ),
    );
  }
}
