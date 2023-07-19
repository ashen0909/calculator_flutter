import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  const Calculator({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Homepage(title: '🧮 Calculator App'),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String output = "0";
  double numOne = 0;
  double numTwo = 0;
  String operand = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "Dele") {
        output = "0";
        numOne = 0;
        numTwo = 0;
        operand = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "/" ||
          buttonText == "x" ||
          buttonText == "=") {
        if (numOne == 0) {
          numOne = double.parse(output);
        } else {
          numTwo = double.parse(output);
        }

        if (operand == "+") {
          output = (numOne + numTwo).toStringAsFixed(2);
        } else if (operand == "-") {
          output = (numOne - numTwo).toStringAsFixed(2);
        } else if (operand == "x") {
          output = (numOne * numTwo).toStringAsFixed(2);
        } else if (operand == "/") {
          output = (numOne / numTwo).toStringAsFixed(2);
        }

        if (buttonText != "=") {
          operand = buttonText;
        }

        numOne = double.parse(output);
        numTwo = 0;
      } else {
        if (output == "0" || output == "0.0") {
          output = buttonText;
        } else {
          output = output + buttonText;
        }
      }
    });
  }

  Widget calcButton(String buttonText, Color bgColor, Color textColor) {
    return Expanded(
      child: SizedBox(
        height: 50.0,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                BorderSide(width: 1.0, color: bgColor),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return bgColor.withOpacity(0.5);
                  }
                  return null;
                },
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: textColor),
            ),
            onPressed: () => buttonPressed(buttonText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calcButton('Dele', const Color.fromARGB(255, 239, 25, 25), const Color.fromARGB(255, 237, 23, 23)),
                    calcButton('%', Colors.grey, Colors.black),
                    calcButton('+/-', Colors.grey, Colors.black),
                    calcButton('/', Color.fromARGB(255, 217, 128, 228), Colors.black),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calcButton('7', Colors.grey[850]!, Colors.black),
                    calcButton('8', Colors.grey[850]!, Colors.black),
                    calcButton('9', Colors.grey[850]!, Colors.black),
                    calcButton('x', Color.fromARGB(255, 217, 128, 228), Colors.black),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calcButton('4', Colors.grey[850]!, Colors.black),
                    calcButton('5', Colors.grey[850]!, Colors.black),
                    calcButton('6', Colors.grey[850]!, Colors.black),
                    calcButton('-', Color.fromARGB(255, 217, 128, 228), Colors.black),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calcButton('1', Colors.grey[850]!, Colors.black),
                    calcButton('2', Colors.grey[850]!, Colors.black),
                    calcButton('3', Colors.grey[850]!, Colors.black),
                    calcButton('+', Color.fromARGB(255, 217, 128, 228), Colors.black),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calcButton('.', Colors.grey[850]!, Colors.black),
                    calcButton('0', Colors.grey[850]!, Colors.black),
                    calcButton('00', Colors.grey[850]!, Colors.black),
                    calcButton('=', Color.fromARGB(255, 217, 128, 228), Colors.black),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}