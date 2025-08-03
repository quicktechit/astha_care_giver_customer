class ReasonListModel {
  ReasonListModel({
      this.status, 
      this.message, 
      this.count, 
      this.partnerCount, 
      this.customerCount, 
      this.customerBeforeCount, 
      this.customerAfterCount, 
      this.data, 
      this.partnerData, 
      this.customerData, 
      this.customerBoforeData, 
      this.customerAfterData,});

  ReasonListModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    partnerCount = json['partnerCount'];
    customerCount = json['customerCount'];
    customerBeforeCount = json['customerBeforeCount'];
    customerAfterCount = json['customerAfterCount'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    if (json['partnerData'] != null) {
      partnerData = [];
      json['partnerData'].forEach((v) {
        partnerData?.add(PartnerData.fromJson(v));
      });
    }
    if (json['customerData'] != null) {
      customerData = [];
      json['customerData'].forEach((v) {
        customerData?.add(CustomerData.fromJson(v));
      });
    }
    if (json['customerBoforeData'] != null) {
      customerBoforeData = [];
      json['customerBoforeData'].forEach((v) {
        customerBoforeData?.add(CustomerBoforeData.fromJson(v));
      });
    }
    if (json['customerAfterData'] != null) {
      customerAfterData = [];
      json['customerAfterData'].forEach((v) {
        customerAfterData?.add(CustomerAfterData.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  int? count;
  int? partnerCount;
  int? customerCount;
  int? customerBeforeCount;
  int? customerAfterCount;
  List<Data>? data;
  List<PartnerData>? partnerData;
  List<CustomerData>? customerData;
  List<CustomerBoforeData>? customerBoforeData;
  List<CustomerAfterData>? customerAfterData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['count'] = count;
    map['partnerCount'] = partnerCount;
    map['customerCount'] = customerCount;
    map['customerBeforeCount'] = customerBeforeCount;
    map['customerAfterCount'] = customerAfterCount;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (partnerData != null) {
      map['partnerData'] = partnerData?.map((v) => v.toJson()).toList();
    }
    if (customerData != null) {
      map['customerData'] = customerData?.map((v) => v.toJson()).toList();
    }
    if (customerBoforeData != null) {
      map['customerBoforeData'] = customerBoforeData?.map((v) => v.toJson()).toList();
    }
    if (customerAfterData != null) {
      map['customerAfterData'] = customerAfterData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CustomerAfterData {
  CustomerAfterData({
      this.id, 
      this.type, 
      this.action, 
      this.title, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  CustomerAfterData.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    action = json['action'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? type;
  String? action;
  String? title;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['action'] = action;
    map['title'] = title;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class CustomerBoforeData {
  CustomerBoforeData({
      this.id, 
      this.type, 
      this.action, 
      this.title, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  CustomerBoforeData.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    action = json['action'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? type;
  String? action;
  String? title;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['action'] = action;
    map['title'] = title;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class CustomerData {
  CustomerData({
      this.id, 
      this.type, 
      this.action, 
      this.title, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  CustomerData.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    action = json['action'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? type;
  String? action;
  String? title;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['action'] = action;
    map['title'] = title;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class PartnerData {
  PartnerData({
      this.id, 
      this.type, 
      this.action, 
      this.title, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  PartnerData.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    action = json['action'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? type;
  String? action;
  String? title;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['action'] = action;
    map['title'] = title;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.type, 
      this.action, 
      this.title, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    action = json['action'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? type;
  String? action;
  String? title;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['action'] = action;
    map['title'] = title;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}