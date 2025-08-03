class StatusModel {
  final String? status;
  final String? message;
  final Data? data;

  StatusModel({
    this.status,
    this.message,
    this.data,
  });

  StatusModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final int? id;
  final int? status;
  final dynamic createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        status = json['status'] as int?,
        createdAt = json['created_at'],
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}