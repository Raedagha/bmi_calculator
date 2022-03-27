import 'package:calculator_bmi/calculator_brain.dart';
import 'package:calculator_bmi/pages/results_page.dart';
import 'package:calculator_bmi/widget/IconCircle.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:calculator_bmi/widget/icon_button.dart';

import '../widget/button.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 180;
  int age = 25;
  int weight = 60;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColour,
      appBar: AppBar(
        title: const Text('BMI'),
        centerTitle: true,
        backgroundColor: kInactiveCardColour,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                ExpandedWidget(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kInactiveCardColour
                      : kActiveCardColour,
                  list: const [
                    IconButtons(
                      text: 'MALE',
                      iconData: Icons.male,
                    )
                  ],
                ),
                ExpandedWidget(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? kInactiveCardColour
                      : kActiveCardColour,
                  list: const [
                    IconButtons(
                      text: 'FEMALE',
                      iconData: Icons.female,
                    )
                  ],
                )
              ],
            ),
          ),
          ExpandedWidget(
            list: [
              const Text(
                'HEIGHT',
                textAlign: TextAlign.center,
                style: kBodyTextStyle,
              ),
              Text(
                height.toStringAsFixed(1),
                textAlign: TextAlign.center,
                style: kNumberTextStyle,
              ),
              Slider(
                  activeColor: kBottomContainerColour,
                  value: height.toDouble(),
                  min: 120,
                  max: 220,
                  onChanged: (val) {
                    setState(() {
                      height = val.toInt();
                    });
                  }),
            ],
          ),
          Row(
            children: [
              ExpandedWidget(
                list: [
                  const Text(
                    'WEIGHT',
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '$weight',
                    textAlign: TextAlign.center,
                    style: kNumberTextStyle,
                  ),
                  Row(
                    children: [
                      IconCircle(
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                        iconData: Icons.add,
                      ),
                      IconCircle(
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                        iconData: Icons.remove,
                      ),
                    ],
                  ),
                ],
              ),
              ExpandedWidget(
                list: [
                  const Text(
                    'AGE',
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '$age',
                    textAlign: TextAlign.center,
                    style: kNumberTextStyle,
                  ),
                  Row(
                    children: [
                      IconCircle(
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        iconData: Icons.add,
                      ),
                      IconCircle(
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                        iconData: Icons.remove,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          MaterialButton(
            color: kBottomContainerColour,
            onPressed: () {
              CalculatorBrain calculator =
                  CalculatorBrain(height: height.toInt(), weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) {
                  return ResultsPage(
                    statement: calculator.getInterpretation(),
                    bmi: calculator.calculateBMI(),
                    result: calculator.getResult(),
                  );
                }),
              );
            },
            padding: const EdgeInsets.all(15),
            child: const Text(
              'CALCULATE',
              style: kTileTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
