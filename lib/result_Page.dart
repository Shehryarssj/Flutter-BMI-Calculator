import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String text, explanation;
  final double bmi;
  final Color resultColour;

  ResultPage({this.bmi, this.text, this.resultColour, this.explanation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Your Result',
              style: resultText1,
            ),
          ),
          Expanded(
            child: ResuableCard(
              colour: activeCardColour,
              onTapFunction: null,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: resultColour,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (bmi).toString(),
                    style: resultText2,
                  ),
                  Text(
                    explanation,
                    textAlign: TextAlign.center,
                    style: resultText3,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
