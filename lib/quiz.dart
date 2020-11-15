import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function asnwerQuestion;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.asnwerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => asnwerQuestion(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
