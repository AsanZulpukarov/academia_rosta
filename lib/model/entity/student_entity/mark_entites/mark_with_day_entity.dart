class MarkWithDayEntity {
  int? id;
  int? correctAnswers;
  int? totalQuestions;
  DateTime? createdDate;
  MarkWithDayEntity(
      {this.id, this.correctAnswers, this.totalQuestions, this.createdDate});

  MarkWithDayEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    correctAnswers = json['correctAnswers'];
    totalQuestions = json['totalQuestions'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['correctAnswers'] = correctAnswers;
    data['totalQuestions'] = totalQuestions;
    data['createdDate'] = createdDate;
    return data;
  }
}
