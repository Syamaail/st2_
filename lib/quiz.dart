import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
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
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late int id;
  var _totalScore = 0;

  @override
  void initState() {
    // TODO: implement initState
    id = widget.questionIndex;
    super.initState();
  }

  void _resetQuiz() {
    setState(() {
      id = 0;
      _totalScore = 0;
    });
  }

  String get resultPhrase {
    String resultText;
    if (_totalScore >= 41) {
      resultText = 'You are awesome!';
      if (kDebugMode) {
        print(_totalScore);
      }
    } else if (_totalScore >= 31) {
      resultText = 'Pretty likeable!';
      if (kDebugMode) {
        print(_totalScore);
      }
    } else if (_totalScore >= 21) {
      resultText = 'You need to work more!';
    } else if (_totalScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      if (kDebugMode) {
        print(_totalScore);
      }
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    var list = widget.questions[id]['answers'] as List<Map<String, Object>>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Score $_totalScore',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFF00E676),
      ),
      body: id == widget.questions.length - 1
          //result page
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultPhrase,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ), //Text
                  //Text
                  TextButton(
                    onPressed: _resetQuiz,
                    child: Container(
                      color: Colors.green,
                      padding: const EdgeInsets.all(14),
                      child: const Text(
                        'Restart Quiz',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ], //<Widget>[]
              ),
            )
          //question page
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        widget.questions[id]['questionPic'].toString()),
                  ),
                ),
                ListView.builder(
                  itemCount: list.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    var data = widget.questions[id]['answers']
                        as List<Map<String, Object>>;
                    return ListTile(
                      onTap: () {
                        setState(() {
                          if (id < widget.questions.length - 1) {
                            id++;
                          }
                          _totalScore = _totalScore +
                              int.parse(data[index]['score'].toString());
                        });
                      },
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(data[index]['text'].toString()),
                    );
                  },
                )
              ],
            ),
    ); //Column
  }
}
