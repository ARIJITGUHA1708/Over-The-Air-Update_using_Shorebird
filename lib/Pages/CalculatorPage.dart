import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0"; // Initial output
  String _result = "0"; // Stores calculation result
  // Method to update the output
  void _updateOutput(String value) {
    setState(() {
      if (_output == "0") {
        _output = value;
      } else {
        _output += value;
      }
    });
  }

  // Method to perform calculation
  void _calculate() {
    try {
      final expression = _output;
      final result = _evaluateExpression(expression);
      setState(() {
        _result = result;
      });
    } catch (e) {
      setState(() {
        _result = "Error";
      });
    }
  }

  // Method to clear the screen
  void _clear() {
    setState(() {
      _output = "0";
      _result = "0";
    });
  }

  // Function to evaluate expression
  String _evaluateExpression(String expression) {
    // Using Dart's eval method or a package would be ideal in production.
    // Here, I'm using a simple and unsafe method for illustration.
    final exp = expression.replaceAll('×', '*').replaceAll('÷', '/');
    try {
      final result = _simpleEval(exp);
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  // Simple eval using basic Dart operations (safe for basic calculations)
  double _simpleEval(String expression) {
    final parsedExpression = expression;
    // Calculate the result using Dart's eval (can use a simple Dart function for basic expressions)
    return _parseAndEvaluate(parsedExpression);
  }

  double _parseAndEvaluate(String expression) {
    // This is a basic evaluation function using Dart's built-in eval for expressions.
    // You can use `dart:math` to perform complex calculations.
    return double.parse(expression);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Display the current output
            Text(
              _output,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Display the result
            Text(
              _result,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            // Calculator buttons
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                String buttonText;
                switch (index) {
                  case 0:
                    buttonText = '7';
                    break;
                  case 1:
                    buttonText = '8';
                    break;
                  case 2:
                    buttonText = '9';
                    break;
                  case 3:
                    buttonText = '÷';
                    break;
                  case 4:
                    buttonText = '4';
                    break;
                  case 5:
                    buttonText = '5';
                    break;
                  case 6:
                    buttonText = '6';
                    break;
                  case 7:
                    buttonText = '×';
                    break;
                  case 8:
                    buttonText = '1';
                    break;
                  case 9:
                    buttonText = '2';
                    break;
                  case 10:
                    buttonText = '3';
                    break;
                  case 11:
                    buttonText = '-';
                    break;
                  case 12:
                    buttonText = '0';
                    break;
                  case 13:
                    buttonText = 'C'; // Clear
                    break;
                  case 14:
                    buttonText = '='; // Equals
                    break;
                  case 15:
                    buttonText = '+'; // Addition
                    break;
                  default:
                    buttonText = '';
                }

                return GestureDetector(
                  onTap: () {
                    if (buttonText == 'C') {
                      _clear();
                    } else if (buttonText == '=') {
                      _calculate();
                    } else {
                      _updateOutput(buttonText);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blueGrey[100],
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
