class QuickTechServiceTypeModel {
  QuickTechServiceTypeModel({
      this.status, 
      this.data,});

  QuickTechServiceTypeModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.agencyType, 
      this.image, 
      this.commission, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    agencyType = json['agency_type'];
    image = json['image'];
    commission = json['commission'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? agencyType;
  String? image;
  int? commission;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['agency_type'] = agencyType;
    map['image'] = image;
    map['commission'] = commission;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}