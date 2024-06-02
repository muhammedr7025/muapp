import 'package:flutter/material.dart';

class IgCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final int id;
  const IgCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD5C6E7)),
        borderRadius: const BorderRadius.all(
            Radius.circular(13.0) //                 <--- border radius here
            ),
      ),
      height: 80,
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/igDetail',
            arguments: {
              'id': id,
            },
          );
        },
        child: Row(
          children: <Widget>[
            Image.asset(
              image, // Your album cover image asset
              width: 65,
              height: 65,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto-bold',
                          fontWeight: FontWeight.bold)),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto-bold',
                          color: Colors.grey)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/igDetail',
                  arguments: {
                    'id': id,
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
