import 'package:flutter/material.dart';

class CareerPage extends StatelessWidget {
  const CareerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Career',
            style: TextStyle(
              fontFamily: 'Poppins-Bold',
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
        title: const Text('Career'),
      ),
    );
  }
}
