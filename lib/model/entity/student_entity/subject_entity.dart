class SubjectEntity {
  int? id;
  String? name;
  int? cost;

  SubjectEntity({this.id, this.name, this.cost});

  SubjectEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cost'] = cost;
    return data;
  }
}
