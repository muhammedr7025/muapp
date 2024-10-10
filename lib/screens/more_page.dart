import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More',
            style: TextStyle(
              fontFamily: 'Poppins-Bold',
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
        title: Text('More'),
      ),
    );
  }
}
