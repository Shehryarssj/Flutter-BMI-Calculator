import 'package:bmi_calculator/calculator.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/result_Page.dart';

int _height = 150;
int _weight = 75;
int _age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ResuableCard(
                    colour: maleCardColour,
                    widget: CardIcon(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                      iconColour: maleCardColour == activeCardColour
                          ? Colors.white
                          : Colors.white30,
                    ),
                    onTapFunction: () {
                      setState(() {
                        maleCardColour = activeCardColour;
                        femaleCardColour = inactiveCardColour;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    colour: femaleCardColour,
                    widget: CardIcon(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                      iconColour: femaleCardColour == activeCardColour
                          ? Colors.white
                          : Colors.white30,
                    ),
                    onTapFunction: () {
                      setState(() {
                        maleCardColour = inactiveCardColour;
                        femaleCardColour = activeCardColour;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(
              colour: activeCardColour,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('HEIGHT'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _height.toString(),
                        style: numberTextStyle,
                      ),
                      Text('cm')
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      trackHeight: 1,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white24,
                      thumbColor: customRed,
                      overlayColor: customRedTransparent,
                    ),
                    child: Slider(
                      divisions: 300,
                      min: 1,
                      max: 300,
                      value: _height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          _height = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ResuableCard(
                    colour: activeCardColour,
                    widget: CardWidget(
                      unit: 'KG',
                      value: _weight,
                      onTapAddIcon: () {
                        setState(() {
                          _weight++;
                        });
                      },
                      onTapRemoveIcon: () {
                        if (_weight > 1) {
                          setState(() {
                            _weight--;
                          });
                        }
                      },
                      type: 'WEIGHT',
                    ),
                  ),
                ),
                // Expanded(
                //   child: ResuableCard(
                //     colour: activeCardColour,
                //     widget: CardWidget(
                //       unit: 'Y',
                //       value: _age,
                //       onTapAddIcon: () {
                //         setState(() {
                //           _age++;
                //         });
                //       },
                //       onTapRemoveIcon: () {
                //         if (_age > 1) {
                //           setState(() {
                //             _age--;
                //           });
                //         }
                //       },
                //       type: 'AGE',
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: customRed,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            onTap: () {
              Map calculations = calculate(_weight, _height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmi: calculations['bmi'],
                            text: calculations['text'],
                            resultColour: calculations['resultColour'],
                            explanation: calculations['explanation'],
                          )));
            },
          ),
        ],
      ),
    );
  }
}
