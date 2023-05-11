class MarkWithTopicEntity {
  int? id;
  int? correctAnswers;
  int? totalQuestions;
  String? topic;

  MarkWithTopicEntity(
      {this.id, this.correctAnswers, this.totalQuestions, this.topic});

  MarkWithTopicEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    correctAnswers = json['correctAnswers'];
    totalQuestions = json['totalQuestions'];
    topic = json['topic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['correctAnswers'] = correctAnswers;
    data['totalQuestions'] = totalQuestions;
    data['topic'] = topic;
    return data;
  }
}
