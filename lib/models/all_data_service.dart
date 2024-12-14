class AllDataService {
  int? id;
  String? name;
  String? image;
  int? price;
  String? description;
  int? userId;
  String? createdAt;
  String? updatedAt;

  AllDataService(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.description,
      this.userId,
      this.createdAt,
      this.updatedAt});

  AllDataService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['description'] = description;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
