import 'package:flutter/material.dart';

class GlossyContainer extends StatelessWidget {
  final Color color;
  final Widget? cardChild;

  const GlossyContainer({super.key, required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}
