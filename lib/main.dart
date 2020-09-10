import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Quizzler',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  List<Icon> scoreKeeper = [];

  void showAlert() {
    Alert(
      context: context,
      type: AlertType.none,
      style: AlertStyle(
        backgroundColor: Colors.black,
        animationType: AnimationType.grow,
        titleStyle: TextStyle(
          color: Colors.white,
        ),
        descStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      title: "Bingo!",
      desc: "You have reached the end of quiz.\n Your score: $score / ${quizBrain.getLengthOfQuestions()}",
      buttons: [
        DialogButton(
          child: Text(
            "Reset Quiz",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              quizBrain.resetQuestions();
              scoreKeeper.clear();
              score = 0;
              Navigator.pop(context);
            });
          },
          width: 120,
        )
      ],
    ).show();
  }

  void checkAnswer(bool userAnswer) {
    setState(() {
      if (quizBrain.getCorrectAnswer() == userAnswer) {
        score++;
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      if (quizBrain.questionsExhausted() == false) {
        quizBrain.nextQuestion();
      } else {
        showAlert();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: scoreKeeper,
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                onPressed: () {
                  checkAnswer(true);
                },
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                onPressed: () {
                  checkAnswer(false);
                },
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
