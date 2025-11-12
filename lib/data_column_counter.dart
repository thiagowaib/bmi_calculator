import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataColumnCounter extends StatelessWidget {
  final String label;
  final int value;

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const DataColumnCounter({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.label,
          style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 42.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: onDecrement,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white24,
                ),
                child: Icon(FontAwesomeIcons.minus),
              ),
            ),
            GestureDetector(
              onTap: onIncrement,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white24,
                ),
                child: Icon(FontAwesomeIcons.plus),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
