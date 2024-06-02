import 'package:flutter/material.dart';
import 'package:muapp/screens/widget/ig_card.dart';

import '../constants/ig_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return IgCard(
            image: igList[index]['image'],
            title: igList[index]['title'],
            subtitle: igList[index]['subtitle'],
            id: igList[index]['id'],
          );
        },
        itemCount: igList.length,
      ),
    );
  }
}
