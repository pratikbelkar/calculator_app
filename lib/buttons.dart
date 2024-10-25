import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  final Color;
  final textcolor;
  final String buttontext;
  final buttontapped;

  Buttons(
      {this.Color,
      required this.buttontext,
      this.textcolor,
      this.buttontapped});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: widget.Color,
            child: Center(
              child: Text(
                widget.buttontext,
                style: TextStyle(color: widget.textcolor, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
