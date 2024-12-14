class ReservationModle {
  int? id;
  String? name;
  String? car;
  int? serviceId;
  String? price;
  String? time;
  String? location;
  String? phone;
  String? emergency;
  String? status;
  int? vendorId;
  String? userId;
  dynamic option2;
  String? createdAt;
  String? updatedAt;

  ReservationModle(
      {this.id,
      this.name,
      this.car,
      this.serviceId,
      this.price,
      this.time,
      this.location,
      this.phone,
      this.emergency,
      this.status,
      this.vendorId,
      this.userId,
      this.option2,
      this.createdAt,
      this.updatedAt});

  ReservationModle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    car = json['car'];
    name = json['name'];
    serviceId = json['service_id'];
    price = json['price'];
    time = json['time'];
    location = json['location'];
    phone = json['phone'];
    emergency = json['emergency'];
    status = json['status'];
    vendorId = json['vendor_id'];
    userId = json['user_id'];
    option2 = json['option2'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['car'] = car;
    data['service_id'] = serviceId;
    data['price'] = price;
    data['time'] = time;
    data['location'] = location;
    data['phone'] = phone;
    data['emergency'] = emergency;
    data['status'] = status;
    data['vendor_id'] = vendorId;
    data['user_id'] = userId;
    data['option2'] = option2;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
