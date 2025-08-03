class PartnerShipModel {
  final String? status;
  final int? count;
  final List<Data>? data;

  PartnerShipModel({
    this.status,
    this.count,
    this.data,
  });

  PartnerShipModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        count = json['count'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'count' : count,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}