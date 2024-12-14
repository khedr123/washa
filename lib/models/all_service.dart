class AllService {
  int? id;
  String? name;
  String? option;
  dynamic createdAt;
  dynamic updatedAt;

  AllService({this.id, this.name, this.option, this.createdAt, this.updatedAt});

  AllService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    option = json['option'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['option'] = option;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
