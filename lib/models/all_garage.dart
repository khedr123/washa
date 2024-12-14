class AllGarage {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic twoFactorConfirmedAt;
  String? location;
  String? type;
  String? category;
  String? profileImage;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  dynamic phone;
  dynamic option1;
  dynamic option2;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;

  AllGarage(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.twoFactorConfirmedAt,
      this.location,
      this.type,
      this.category,
      this.profileImage,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.phone,
      this.option1,
      this.option2,
      this.currentTeamId,
      this.profilePhotoPath,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoUrl});

  AllGarage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    location = json['location'];
    type = json['type'];
    category = json['category'];
    profileImage = json['profile_image'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    phone = json['phone'];
    option1 = json['option1'];
    option2 = json['option2'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['two_factor_confirmed_at'] = twoFactorConfirmedAt;
    data['location'] = location;
    data['type'] = type;
    data['category'] = category;
    data['profile_image'] = profileImage;
    data['image1'] = image1;
    data['image2'] = image2;
    data['image3'] = image3;
    data['image4'] = image4;
    data['phone'] = phone;
    data['option1'] = option1;
    data['option2'] = option2;
    data['current_team_id'] = currentTeamId;
    data['profile_photo_path'] = profilePhotoPath;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_photo_url'] = profilePhotoUrl;
    return data;
  }
}
