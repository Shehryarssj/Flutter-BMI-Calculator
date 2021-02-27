import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResuableCard extends StatelessWidget {
  ResuableCard({this.colour, this.widget, this.onTapFunction});
  final Color colour;
  final Widget widget;
  final Function onTapFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        child: widget,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        margin: EdgeInsets.all(7),
      ),
    );
  }
}

class CardIcon extends StatelessWidget {
  CardIcon({this.icon, this.text, this.iconColour});
  final icon, text, iconColour;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: iconColour,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            text,
            style: TextStyle(color: iconColour),
          ),
        )
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  final String type, unit;
  final int value;
  final Function onTapAddIcon, onTapRemoveIcon;
  CardWidget(
      {this.type,
      this.value,
      this.onTapAddIcon,
      this.onTapRemoveIcon,
      this.unit});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(type),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              value.toString(),
              style: numberTextStyle,
            ),
            Text(unit)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: onTapAddIcon,
              color: backgroundColour,
              child: Icon(
                Icons.add,
                size: 40.0,
              ),
              shape: CircleBorder(),
            ),
            RaisedButton(
              color: backgroundColour,
              onPressed: onTapRemoveIcon,
              child: Icon(
                Icons.remove,
                size: 40.0,
              ),
              shape: CircleBorder(),
            ),
          ],
        )
      ],
    );
  }
}
