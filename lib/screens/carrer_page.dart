import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CareerPage extends StatelessWidget {
  const CareerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Career',
          style: GoogleFonts.poppins(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
