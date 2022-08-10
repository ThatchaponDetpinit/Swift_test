import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class ShowCalculator extends StatefulWidget {
  const ShowCalculator({Key? key}) : super(key: key);

  @override
  State<ShowCalculator> createState() => _ShowCalculatorState();
}

class _ShowCalculatorState extends State<ShowCalculator> {
  Widget numberButton(String buttonText, Color buttonColor, Color textColor) {
    return ElevatedButton(
        onPressed: () {
          calculate(buttonText);
        },
        style: ElevatedButton.styleFrom(
            fixedSize: Size(80, 80),
            shape: CircleBorder(),
            primary: buttonColor),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 25, color: textColor),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(10),
                child: Text(
                  equation,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(10),
                child: Text(
                  result,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 60),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberButton('c', Colors.grey, Colors.black),
              numberButton('+/-', Colors.grey, Colors.black),
              numberButton('%', Colors.grey, Colors.black),
              numberButton('/', Colors.orange, Colors.white)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberButton('7', (Colors.grey[850])!, Colors.white),
              numberButton('8', (Colors.grey[850])!, Colors.white),
              numberButton('9', (Colors.grey[850])!, Colors.white),
              numberButton('x', Colors.orange, Colors.white)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberButton('4', (Colors.grey[850])!, Colors.white),
              numberButton('5', (Colors.grey[850])!, Colors.white),
              numberButton('6', (Colors.grey[850])!, Colors.white),
              numberButton('-', Colors.orange, Colors.white)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberButton('1', (Colors.grey[850])!, Colors.white),
              numberButton('2', (Colors.grey[850])!, Colors.white),
              numberButton('3', (Colors.grey[850])!, Colors.white),
              numberButton('+', Colors.orange, Colors.white)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberButton('0', (Colors.grey[850])!, Colors.white),
              numberButton('00', (Colors.grey[850])!, Colors.white),
              numberButton('.', (Colors.grey[850])!, Colors.white),
              numberButton('=', (Colors.orange), Colors.white)
            ],
          )
        ],
      ),
    );
  }

  String equation = '0';
  String result = '0';
  String expression = '';
  void calculate(String buttonText) {
    setState(() {
      if (buttonText == 'c') {
        equation = '0';
        result = '0';
      } else if (buttonText == '=') {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'error';
        }
      } else {
        if (equation == '0') {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }
}
