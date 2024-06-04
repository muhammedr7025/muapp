import 'package:flutter/material.dart';

class LcCard extends StatelessWidget {
  const LcCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(241, 236, 234, 236),
          borderRadius: BorderRadius.circular(20),
        ),
        height: screenHeight / 2,
        width: screenWidth - (screenWidth / 3),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 191, 189, 189),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: Center(
                      child: Image.asset('assets/images/ig/iot.png'),
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 13, right: 10, top: 12),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('My cutee',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(
                          Icons.people, // The icon
                          color: Color.fromARGB(255, 10, 10, 10), // Icon color
                          size: 25, // Icon size
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.money, // The icon
                          color: Color.fromARGB(255, 10, 10, 10), // Icon color
                          size: 25, // Icon size
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '2500',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
