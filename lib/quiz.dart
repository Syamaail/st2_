import 'package:flutter/material.dart';

import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = questions[questionIndex]['answers'] as List<Map<String, Object>>;
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'].toString(),
        ), //Question
        ListView.builder(
          itemCount: data.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                var action = data[index]['score'].toString();
                print(action);
              },
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(data[index]['text'].toString()),
            );
          },
        )
      ],
    ); //Column
  }
}
