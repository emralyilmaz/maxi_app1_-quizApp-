import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "When did Mehmet Yılmaz born?",
      "answers": [
        {"text": "19 Dec 1987", "score": 0},
        {"text": "16 Dec 1988", "score": 0},
        {"text": "19 Dec 1987", "score": 0},
        {"text": "16 Dec 1987", "score": 4}
      ],
    },
    {
      "questionText": "What is his(MY) favorite color?",
      "answers": [
        {"text": "White", "score": 0},
        {"text": "Black", "score": 3},
        {"text": "Blue", "score": 2},
        {"text": "Green", "score": 1}
      ],
    },
    {
      "questionText": "Which is his(MY) favorite his app?",
      "answers": [
        {"text": "Mywallet", "score": 3},
        {"text": "Araç Değer", "score": 2},
        {"text": "Mutfak Perisi", "score": 2},
        {"text": "Cüzdanım (2015)", "score": 2}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    //_totalScore = _totalScore + score; ikisi aynı şeydir.

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
