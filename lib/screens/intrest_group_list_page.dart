import 'package:flutter/material.dart';
import '../constants/ig_list.dart';
import 'widget/ig_card.dart';

class IntrestGroupListPage extends StatelessWidget {
  const IntrestGroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Group',
            style: TextStyle(
              fontFamily: 'Poppins-Bold',
              fontSize: 25,
              color: Colors.black,
            )),
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
