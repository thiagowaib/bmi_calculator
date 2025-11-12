import 'package:bmi_calculator/glossy_container.dart';
import 'package:flutter/material.dart';

import 'gender.dart';

const activeCardColor = Color(0xFF1D1E33);

class ResultPage extends StatelessWidget {
  final Gender gender;
  final int height;
  final int weight;
  final int age;

  const ResultPage({
    super.key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    final double heightMeters = height / 100;
    final double bmi = weight / (heightMeters * heightMeters);

    String interpretation;
    String result;
    Color color;

    if (bmi < 18.5) {
      color = Colors.orange;
      result = "UNDERWEIGHT";
      interpretation = "Try to eat a balanced diet.";
    } else if (bmi < 25) {
      color = Colors.green;
      result = "NORMAL";
      interpretation = "Great job maintaining it!";
    } else if (bmi < 30) {
      color = Colors.orange;
      result = "OVERWEIGHT";
      interpretation = "Regular exercise can help.";
    } else {
      color = Colors.red;
      result = "OBESE";
      interpretation = "Consider consulting a healthcare professional.";
    }

    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 15.0, bottom: 10.0),
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 32.0, fontStyle: FontStyle.italic),
            ),
          ),
          Expanded(
            child: GlossyContainer(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 36.0,
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      interpretation,
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text(
              'RE-CALCULATE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
