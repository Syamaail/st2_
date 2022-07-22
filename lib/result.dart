// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final int resultScore;
  final Function resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late String text;

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (widget.resultScore >= 41) {
      resultText = 'You are awesome!';
      print(widget.resultScore);
    } else if (widget.resultScore >= 31) {
      resultText = 'Pretty likeable!';
      print(widget.resultScore);
    } else if (widget.resultScore >= 21) {
      resultText = 'You need to work more!';
    } else if (widget.resultScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      print(widget.resultScore);
    }
    return resultText;
  }

  @override
  void initState() {
    // TODO: implement initState
    text = resultPhrase;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '${widget.resultScore}',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(
            onPressed: widget.resetHandler(),
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          // FlatButton is deprecated and should not be used
          // Use TextButton instead

          // FlatButton(
          // child: Text(
          //	 'Restart Quiz!',
          // ), //Text
          // textColor: Colors.blue,
          // onPressed: resetHandler(),
          // ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
