import 'package:math_expressions/math_expressions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var option = " ";
  var answer = " ";
  final List<String> buttons = [
    "C",
    "del",
    "%",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "-",
    "^",
    "0",
    ".",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.lightGreen,
      //
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.lightGreen,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      option,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white,
                        Colors.greenAccent,
                      ])),
              child: Center(
                  child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return MyButtons(
                        Colors.green[400], buttons[index], Colors.black, () {
                      setState(() {
                        option = " ";
                        answer = "";
                      });
                    });
                  } else if (index == 1) {
                    return MyButtons(Colors.red, "DEL", Colors.black, () {
                      setState(() {
                        option = option.substring(0, option.length - 1);
                      });
                    });
                  } else if (index == 19) {
                    return MyButtons(
                        Colors.green[400], buttons[index], Colors.black, () {
                      setState(() {
                        getAnswer();
                      });
                    });
                  } else {
                    return MyButtons(
                        isoperator(buttons[index])
                            ? Colors.green[400]
                            : Colors.green[200],
                        buttons[index],
                        Colors.black, () {
                      setState(() {
                        option = option + buttons[index];
                      });
                    });
                  }
                },
              )),
            ),
          ),
        ],
      ),
    ));
  }

  bool isoperator(String x) {
    if (x == "/" || x == "%" || x == "-" || x == "+" || x == "*" || x == "=") {
      return true;
    }
    return false;
  }

  void getAnswer() {
    String number = option;
    Parser p = Parser();
    Expression exp = p.parse(number);
    ContextModel C = ContextModel();
    double ans = exp.evaluate(EvaluationType.REAL, C);
    answer = ans.toString();
  }
}
