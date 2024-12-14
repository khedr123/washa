class AllProfileData {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? twoFactorConfirmedAt;
  String? location;
  Null? type;
  String? category;
  Null? profileImage;
  Null? image1;
  Null? image2;
  Null? image3;
  Null? image4;
  Null? phone;
  Null? option1;
  Null? option2;
  Null? currentTeamId;
  Null? profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;

  AllProfileData(
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

  AllProfileData.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['location'] = this.location;
    data['type'] = this.type;
    data['category'] = this.category;
    data['profile_image'] = this.profileImage;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['phone'] = this.phone;
    data['option1'] = this.option1;
    data['option2'] = this.option2;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}