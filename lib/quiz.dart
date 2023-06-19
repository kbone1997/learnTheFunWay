import 'package:first_app/data/ques.dart';
import 'package:first_app/question_screen.dart';
import 'package:first_app/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-Screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question-Screen';
    });
  }

  void resultScreen() {
    setState(() {
      activeScreen = 'start-Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == question.length) {
      setState(() {
        activeScreen = "result-Screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = StartScreen(switchScreen);

    if (activeScreen == 'start-Screen') {
      currentScreen = StartScreen(switchScreen);
    } else if (activeScreen == 'question-Screen') {
      currentScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'result-Screen') {
      currentScreen = ResultScreen(
        chosenAnswer: selectedAnswers,
      );
    }

    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueGrey,
                Color.fromARGB(255, 76, 97, 107),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
