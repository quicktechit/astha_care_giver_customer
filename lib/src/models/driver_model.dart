class DriverModel {
  final String? status;
  final List<Data>? data;
  final List<Training>? training;
  final List<Supply>? supply;

  DriverModel({
    this.status,
    this.data,
    this.training,
    this.supply,
  });

  DriverModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        training = (json['training'] as List?)?.map((dynamic e) => Training.fromJson(e as Map<String,dynamic>)).toList(),
        supply = (json['supply'] as List?)?.map((dynamic e) => Supply.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.map((e) => e.toJson()).toList(),
    'training' : training?.map((e) => e.toJson()).toList(),
    'supply' : supply?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final String? type;
  final String? name;
  final String? description;
  final String? address;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.type,
    this.name,
    this.description,
    this.address,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        address = json['address'] as String?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'name' : name,
    'description' : description,
    'address' : address,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Training {
  final int? id;
  final String? type;
  final String? name;
  final String? description;
  final String? address;
  final String? link;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Training({
    this.id,
    this.type,
    this.name,
    this.description,
    this.address,
    this.link,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Training.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        address = json['address'] as String?,
        link = json['link'] as String?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'name' : name,
    'description' : description,
    'address' : address,
    'link' : link,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Supply {
  final int? id;
  final String? type;
  final String? name;
  final String? description;
  final String? address;
  final String? link;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Supply({
    this.id,
    this.type,
    this.name,
    this.description,
    this.address,
    this.link,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Supply.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        address = json['address'] as String?,
        link = json['link'] as String?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'name' : name,
    'description' : description,
    'address' : address,
    'link' : link,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}