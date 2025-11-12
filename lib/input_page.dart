import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'data_column_counter.dart';
import 'gender.dart';
import 'glossy_container.dart';
import 'labeled_icon.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _gender = Gender.M;
  double _height = 150.0;
  int _weight = 60;
  int _age = 25;

  void _incWeight() {
    if (_weight >= 20 && _weight < 200) {
      setState(() {
        _weight++;
      });
    }
  }

  void _decWeight() {
    if (_weight > 20 && _weight <= 200) {
      setState(() {
        _weight--;
      });
    }
  }

  void _incAge() {
    if (_age >= 2 && _age < 100) {
      setState(() {
        _age++;
      });
    }
  }

  void _decAge() {
    if (_age > 2 && _age <= 100) {
      setState(() {
        _age--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR"), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _gender = Gender.M;
                      });
                    },
                    child: GlossyContainer(
                      color: _gender == Gender.M
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: LabeledIcon(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _gender = Gender.F;
                      });
                    },
                    child: GlossyContainer(
                      color: _gender == Gender.F
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: LabeledIcon(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GlossyContainer(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        _height.round().toString(),
                        style: TextStyle(
                          fontSize: 42.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' cm',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ],
                  ),
                  Slider(
                    value: _height,
                    min: 80.0,
                    max: 200.0,
                    divisions: 120,
                    onChanged: (double v) {
                      setState(() {
                        _height = v;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GlossyContainer(
                    color: activeCardColor,
                    cardChild: DataColumnCounter(
                      label: 'WEIGHT',
                      value: _weight,
                      onIncrement: _incWeight,
                      onDecrement: _decWeight,
                    ),
                  ),
                ),
                Expanded(
                  child: GlossyContainer(
                    color: activeCardColor,
                    cardChild: DataColumnCounter(
                      label: 'AGE',
                      value: _age,
                      onIncrement: _incAge,
                      onDecrement: _decAge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      gender: _gender,
                      height: _height.round(),
                      weight: _weight,
                      age: _age,
                    );
                  },
                ),
              );
            },
            style: FilledButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text(
              'CALCULATE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
