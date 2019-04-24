import 'package:flutter/material.dart';

class PokeBadge extends StatelessWidget {
  final String text;
  final String title;
  final Color color;
  final Color textColor;

  PokeBadge(
      {this.text,
      this.title = '',
      this.color = Colors.black,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // If there is no title, simply put in a empty Container,
        // Else show the text.
        title == ''
            ? Container()
            : Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
        Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(22.0))),
          child: Column(
            children: <Widget>[
              Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
