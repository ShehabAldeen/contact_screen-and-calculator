import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  String text;
  Function onBtClick;

  Buttons(this.text, this.onBtClick);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            onBtClick(text);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
