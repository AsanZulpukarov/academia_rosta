class MarkWithTopicEntity {
  int? id;
  int? correctAnswers;
  int? wrongAnswer;
  int? totalQuestions;
  String? topic;

  MarkWithTopicEntity(
      {this.id, this.correctAnswers, this.totalQuestions, this.topic});

  MarkWithTopicEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    correctAnswers = json['correctAnswers'];
    totalQuestions = json['totalQuestions'];
    topic = setTopic(json['topic']);

    wrongAnswer = (totalQuestions! - correctAnswers!);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['correctAnswers'] = correctAnswers;
    data['totalQuestions'] = totalQuestions;
    data['topic'] = topic;
    return data;
  }

  setTopic(String? jsonTopic) {
    if (jsonTopic == null || jsonTopic == "PSV")
      return "Простое\nСложение\nВычитание";
    if (jsonTopic.substring(0, 2) == "PB") {
      return 'Помощь\nбрата\n${jsonTopic.substring(2)}';
    } else {
      return 'Помощь\nдруга\n${jsonTopic.substring(2)}';
    }
  }
}
