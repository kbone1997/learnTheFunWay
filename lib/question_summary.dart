import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.dataSummary});

  final List<Map<String, Object>> dataSummary;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: dataSummary.map((e) {
            return Row(
              children: [
                Text(((e['question-index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text((e['question'] as String)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(e['correct_answer'] as String),
                      Text(e['Your_answer'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
