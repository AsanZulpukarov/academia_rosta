class TimetableEntity {
  int? id;
  String? monday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? sunday;
  String? saturday;

  Map<int, String>? checkNullWeekDays;
  TimetableEntity(this.id,
      {this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.sunday,
      this.saturday}) {
    getNonNullWeekDay();
  }

  TimetableEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    sunday = json['sunday'];
    saturday = json['saturday'];
    getNonNullWeekDay();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['monday'] = monday;
    data['tuesday'] = tuesday;
    data['wednesday'] = wednesday;
    data['thursday'] = thursday;
    data['friday'] = friday;
    data['sunday'] = sunday;
    data['saturday'] = saturday;
    return data;
  }

  getNonNullWeekDay() {
    if (monday != null) checkNullWeekDays![1] = monday!;
    if (tuesday != null) checkNullWeekDays![2] = tuesday!;
    if (wednesday != null) checkNullWeekDays![3] = wednesday!;
    if (thursday != null) checkNullWeekDays![4] = thursday!;
    if (friday != null) checkNullWeekDays![5] = friday!;
    if (sunday != null) checkNullWeekDays![6] = sunday!;
    if (saturday != null) checkNullWeekDays![7] = saturday!;
  }
}
