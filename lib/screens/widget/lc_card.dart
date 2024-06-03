import 'package:flutter/material.dart';

class LcCard extends StatelessWidget {
  final Color clr;
  final String txt;
  const LcCard({
    super.key,
    required this.clr,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: clr,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        height: 340,
        width: 270,
        alignment: Alignment.center,
        child: Text(txt),
      ),
    );
  }
}
