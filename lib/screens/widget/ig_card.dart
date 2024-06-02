import 'package:flutter/material.dart';

class IgCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const IgCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: const BorderRadius.all(
            Radius.circular(13.0) //                 <--- border radius here
            ),
      ),
      height: 80,
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: <Widget>[
            Image.network(
              'https://picsum.photos/250?image=9', // Your album cover image asset
              width: 70,
              height: 50,
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
                // Implement your action
              },
            )
          ],
        ),
      ),
    );
  }
}
