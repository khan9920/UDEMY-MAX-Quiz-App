import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // const is compile time constant
    const questions = [
      {
        'questionText': 'What is your favourite color?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What is your favourite animal?',
        'answers': ['Rabbit', 'Snack', 'Elephant', 'Lion']
      },
      {
        'questionText': 'Who is your favourite instructor',
        'answers': ['Max', 'Max', 'Max', 'Max']
      }
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: Column(
            children: [
              Question(questions[_questionIndex]['questionText']),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList(),
            ],
          )),
    );
  }
}
