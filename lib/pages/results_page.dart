import 'package:flutter/material.dart';
import '../constant.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key,
      required this.result,
      required this.statement,
      required this.bmi})
      : super(key: key);
  final String result;
  final String statement;
  final String bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColour,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your Result',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  color: kActiveCardColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        result,
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmi,
                        style: kNumberTextStyle,
                      ),
                      Text(
                        statement,
                        textAlign: TextAlign.center,
                        style: kTileTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MaterialButton(
                padding: const EdgeInsets.all(23),
                color: kBottomContainerColour,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'RE-CALCULATE',
                  style: kTileTextStyle,
                ))
          ],
        ),
      ),
    );
  }
}
