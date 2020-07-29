import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({this.width = 0.0, this.text = "", this.textSize = 18.0, this.textColor = Colors.white, this.tapped});
  Function tapped;
  final double width;
  final String text;
  final Color textColor;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30.0)
        ),
        child: Center(child: Text(text, style: TextStyle(color: textColor, fontSize: textSize, fontWeight: FontWeight.bold),)),

      ),
    );;
  }
}
