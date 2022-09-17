import 'package:flutter/material.dart';
import 'package:uber_clone_flutter/src/utils/colors.dart' as utils;

class ButtonApp extends StatelessWidget {
  Color color;
  String text;
  Color textColor;
  IconData icon;
  Function onPressed;

  ButtonApp(
      {this.color = Colors.red,
      this.textColor = Colors.white,
      this.icon = Icons.arrow_forward_ios,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: textColor),
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
                  ))),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 50,
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  icon,
                  color: utils.Colors.uberCloneColor,
                ),
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
