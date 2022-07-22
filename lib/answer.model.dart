class QuizModel {
  String? questionText;
  List<AnswerModels>? answers;

  QuizModel({this.questionText, this.answers});

  QuizModel.fromJson(Map<String, dynamic> json) {
    questionText = json['questionText'];
    if (json['answers'] != null) {
      answers = <AnswerModels>[];
      json['answers'].forEach((v) {
        answers!.add(new AnswerModels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionText'] = this.questionText;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnswerModels {
  String? text;
  int? score;

  AnswerModels({this.text, this.score});

  AnswerModels.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['score'] = this.score;
    return data;
  }
}
