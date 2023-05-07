class TimetableEntity {
  int? id;
  String? monday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? sunday;
  String? saturday;

  TimetableEntity(this.id,
      {this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.sunday,
      this.saturday});

  TimetableEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    sunday = json['sunday'];
    saturday = json['saturday'];
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
}
