import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

class LabeledIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final double? iconSize;

  const LabeledIcon({
    super.key,
    required this.label,
    required this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: iconSize ?? 80.0),
        SizedBox(height: 15),
        Text(label, style: labelTextStyle),
      ],
    );
  }
}
