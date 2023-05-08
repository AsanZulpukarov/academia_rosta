class Subject {
  Null? id;
  String? name;
  int? cost;

  Subject({this.id, this.name, this.cost});

  Subject.fromJson(Map<String, dynamic> json) {
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
