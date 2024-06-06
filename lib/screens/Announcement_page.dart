import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcement',
            style: TextStyle(
              fontFamily: 'Poppins-Bold',
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }
}
