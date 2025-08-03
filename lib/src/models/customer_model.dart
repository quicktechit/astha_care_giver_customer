class CustomerProfileModel {
  CustomerProfileModel({
      this.status,
      this.data,
  });

  final String? status;
  final CustomerData? data;

  factory CustomerProfileModel.fromJson(Map<String, dynamic> json) {
    return CustomerProfileModel(
      status: json["status"],
      data: json["data"] == null ? null : CustomerData.fromJson(json["data"]),
    );
  }
}

class CustomerData {
  CustomerData({
      this.id,
      this.name,
      this.phone,
      this.email,
      this.birthday,
      this.gender,
      this.district,
      this.address,
      this.image,
      this.verify,
      this.expireAt,
      this.forgotCode,
      this.status,
      this.createdAt,
      this.updatedAt,
  });

  final int? id;
  final dynamic name;
  final String? phone;
  final dynamic email;
  final dynamic birthday;
  final dynamic gender;
  final dynamic district;
  final dynamic address;
  final dynamic image;
  final String? verify;
  final DateTime? expireAt;
  final dynamic forgotCode;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      birthday: json["birthday"],
      gender: json["gender"],
      district: json["district"],
      address: json["address"],
      image: json["image"],
      verify: json["verify"],
      expireAt: DateTime.tryParse(json["expire_at"] ?? ""),
      forgotCode: json["forgot_code"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
