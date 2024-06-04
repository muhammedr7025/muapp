import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/ig_list.dart';
import 'widget/ig_card.dart';

class IntrestGroupListPage extends StatelessWidget {
  const IntrestGroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Interest Group',
          style: GoogleFonts.poppins(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
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
