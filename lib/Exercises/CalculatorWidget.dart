import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Exercises/CalculatorButtons.dart';

class CalculatorWidget extends StatefulWidget {
  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String result = '';

  String oprator = '';
  String LHS = '';

  void onOperatorClick(String clickedOperator) {
    if (oprator.isEmpty) {
      oprator = clickedOperator;
      LHS = result;
      result = '';
      setState(() {});
    } else {
      String RHS = result;
      LHS = calculation(LHS, oprator, RHS);
      oprator = '';
      result = '';
      setState(() {});
    }
  }

  void onEquelClick(String equel) {
    String RHS = result;
    result = calculation(LHS, oprator, RHS);
    oprator = '';
    LHS = '';
    setState(() {});
  }

  String calculation(
    String lhs,
    String operator,
    String rhs,
  ) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double res = 0;
    if (oprator == '+') res = n1 + n2;
    if (oprator == '-') res = n1 - n2;
    if (oprator == '*') res = n1 * n2;
    if (oprator == '/') {
      res = n1 / n2;
    }
    return res.toString();
  }

  void onDigiteClick(String clickedText) {
    result += clickedText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('calculator app'),
      ),
      body: Container(
        color: Colors.black38,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        result == '' ? '0' : result,
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                )),
            Divider(
              thickness: 4,
              color: Colors.black,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Buttons('7', onDigiteClick),
                  Buttons('8', onDigiteClick),
                  Buttons('9', onDigiteClick),
                  Buttons('/', onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Buttons('4', onDigiteClick),
                  Buttons('5', onDigiteClick),
                  Buttons('6', onDigiteClick),
                  Buttons('*', onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Buttons('1', onDigiteClick),
                  Buttons('2', onDigiteClick),
                  Buttons('3', onDigiteClick),
                  Buttons('+', onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Buttons('.', onDigiteClick),
                  Buttons('0', onDigiteClick),
                  Buttons('=', onEquelClick),
                  Buttons('-', onOperatorClick),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
