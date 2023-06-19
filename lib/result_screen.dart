import 'package:first_app/data/ques.dart';
import 'package:first_app/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question-index': i,
        'question': question[i].text,
        'correct_answer': question[i].answers[0],
        'Your_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestion = question.length;
    final summaryData = getSummary();
    final correctAnswer = summaryData.where((data) {
      return data['correct_answer'] == data['Your_answer'];
    }).length;

    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You have answered $correctAnswer correct out of $totalQuestion'),
            const SizedBox(
              height: 5,
            ),
            QuestionSummary(dataSummary: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text('restart quiz'))
          ],
        ),
      ),
    );
  }
}
