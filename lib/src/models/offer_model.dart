class OfferModel {
  final String? status;
  final List<Data>? data;
  final List<ToDays>? toDays;
  final List<Special>? special;

  OfferModel({
    this.status,
    this.data,
    this.toDays,
    this.special,
  });

  OfferModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        toDays = (json['to_days'] as List?)?.map((dynamic e) => ToDays.fromJson(e as Map<String,dynamic>)).toList(),
        special = (json['special'] as List?)?.map((dynamic e) => Special.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.map((e) => e.toJson()).toList(),
    'to_days' : toDays?.map((e) => e.toJson()).toList(),
    'special' : special?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final String? type;
  final String? carName;
  final int? sit;
  final String? fromAddress;
  final String? toAddress;
  final int? price;
  final String? phone;
  final String? description;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.type,
    this.carName,
    this.sit,
    this.fromAddress,
    this.toAddress,
    this.price,
    this.phone,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String?,
        carName = json['car_name'] as String?,
        sit = json['sit'] as int?,
        fromAddress = json['from_address'] as String?,
        toAddress = json['to_address'] as String?,
        price = json['price'] as int?,
        phone = json['phone'] as String?,
        description = json['description'] as String?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'car_name' : carName,
    'sit' : sit,
    'from_address' : fromAddress,
    'to_address' : toAddress,
    'price' : price,
    'phone' : phone,
    'description' : description,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class ToDays {
  final int? id;
  final String? type;
  final String? carName;
  final int? sit;
  final String? fromAddress;
  final String? toAddress;
  final int? price;
  final String? phone;
  final String? description;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  ToDays({
    this.id,
    this.type,
    this.carName,
    this.sit,
    this.fromAddress,
    this.toAddress,
    this.price,
    this.phone,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  ToDays.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String?,
        carName = json['car_name'] as String?,
        sit = json['sit'] as int?,
        fromAddress = json['from_address'] as String?,
        toAddress = json['to_address'] as String?,
        price = json['price'] as int?,
        phone = json['phone'] as String?,
        description = json['description'] as String?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'car_name' : carName,
    'sit' : sit,
    'from_address' : fromAddress,
    'to_address' : toAddress,
    'price' : price,
    'phone' : phone,
    'description' : description,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Special {
  final int? id;
  final String? type;
  final String? carName;
  final int? sit;
  final String? fromAddress;
  final String? toAddress;
  final int? price;
  final String? phone;
  final String? description;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Special({
    this.id,
    this.type,
    this.carName,
    this.sit,
    this.fromAddress,
    this.toAddress,
    this.price,
    this.phone,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Special.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String?,
        carName = json['car_name'] as String?,
        sit = json['sit'] as int?,
        fromAddress = json['from_address'] as String?,
        toAddress = json['to_address'] as String?,
        price = json['price'] as int?,
        phone = json['phone'] as String?,
        description = json['description'] as String?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'car_name' : carName,
    'sit' : sit,
    'from_address' : fromAddress,
    'to_address' : toAddress,
    'price' : price,
    'phone' : phone,
    'description' : description,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}