class DrivingTrainingListModel {
  final bool? success;
  final List<DataT>? data;

  DrivingTrainingListModel({
    this.success,
    this.data,
  });

  DrivingTrainingListModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        data = (json['data'] as List?)?.map((dynamic e) => DataT.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'success' : success,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class DataT {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? createdAt;
  final String? updatedAt;

  DataT({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  DataT.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        phone = json['phone'] as String?,
        address = json['address'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'phone' : phone,
    'address' : address,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}