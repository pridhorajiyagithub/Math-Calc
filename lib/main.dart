import 'dart:ui';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  String dtext = "Ac";
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 60.0;
  buttonPressed(String dtext) {
    setState(() {
      if (dtext == "AC") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 60.0;
      } else if (dtext == "=") {
        equationFontSize = 38.0;
        resultFontSize = 60.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = dtext;
        } else {
          equationFontSize = 60.0;
          resultFontSize = 38.0;
          equation = equation + dtext;
        }
      }
    });
  }

  Widget calcbutton(String dtext, Color dcolor, Color tcolor, double a) {
    return Container(
//margin: EdgeInsets.only(left: 20),
      height: 70,
      width: a,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: dcolor,
      ),
      child: InkWell(
        onTap: () => buttonPressed(dtext),
        child: Ink(
          child: Text(
            dtext,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: tcolor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2e2d32),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  equation,
                  style: TextStyle(
                    color: const Color(0xff8d8d8d),
                    fontSize: equationFontSize,
                  ),
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  result,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: resultFontSize,
                  ),
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 20),
              calcbutton('AC', const Color(0xffff5a66), Colors.white, 170),
              SizedBox(width: 23),
              calcbutton(
                  '%', const Color(0xff2e2d32), const Color(0xff8d8d8d), 100),
              calcbutton(
                  '/', const Color(0xff2e2d32), const Color(0xffff5a66), 100),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              calcbutton('7', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton('8', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton('9', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton(
                  '*', const Color(0xff2e2d32), const Color(0xffff5a66), 100),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              calcbutton('4', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton('5', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton('6', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton(
                  '-', const Color(0xff2e2d32), const Color(0xffff5a66), 100),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              calcbutton('1', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton('2', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton('3', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton(
                  '+', const Color(0xff2e2d32), const Color(0xffff5a66), 100),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              calcbutton('00', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton('0', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              calcbutton('.', const Color(0xff2e2d32), Colors.white, 100),
              SizedBox(width: 5),
              SizedBox(width: 15),
              calcbutton('=', const Color(0xffff5a66), Colors.white, 70),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
      backgroundColor: const Color(0xff2e2d32),
    );
  }
}
