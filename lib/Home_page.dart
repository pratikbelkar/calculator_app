import 'package:calculator_app/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String userquetion = '';

  String userAnswer = '';

  final List<String> buttons = [
    'c',
    'del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[100],
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userquetion,
                          style: TextStyle(fontSize: 30),
                        )),
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userAnswer,
                          style: TextStyle(fontSize: 30),
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Buttons(
                          buttontapped: () {
                            setState(() {
                              userquetion = '';
                            });
                          },
                          buttontext: buttons[index],
                          Color: Colors.green,
                          textcolor: Colors.white);
                    } else if (index == 1) {
                      return Buttons(
                          buttontapped: () {
                            setState(() {
                              userquetion = userquetion.substring(
                                  0, userquetion.length - 1);
                            });
                          },
                          buttontext: buttons[index],
                          Color: Colors.red,
                          textcolor: Colors.white);
                    } else if (index == buttons.length - 1) {
                      return Buttons(
                          buttontapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttontext: buttons[index],
                          Color: Colors.deepPurple,
                          textcolor: Colors.white);
                    } else {
                      return Buttons(
                          buttontapped: () {
                            setState(() {
                              userquetion += buttons[index];
                            });
                          },
                          buttontext: buttons[index],
                          Color: isoperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          textcolor: isoperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple);
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }

  bool isoperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '+' || x == '=' || x == '-') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalquetion = userquetion;

    Parser p = Parser();
    Expression exp = p.parse(finalquetion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
