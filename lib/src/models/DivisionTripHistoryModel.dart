class DivisionTripHistoryModel {
  DivisionTripHistoryModel({
      this.status, 
      this.message, 
      this.divisionTripConfirmCount, 
      this.divisionTripCompleteCount, 
      this.divisionTripCancelCount, 
      this.divisionTripConfirmHistory, 
      this.divisionTripCompleteHistory, 
      this.divisionTripCancelHistory,});

  DivisionTripHistoryModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    divisionTripConfirmCount = json['division_trip_confirm_count'];
    divisionTripCompleteCount = json['division_trip_complete_count'];
    divisionTripCancelCount = json['division_trip_cancel_count'];
    if (json['division_trip_confirm_history'] != null) {
      divisionTripConfirmHistory = [];
      json['division_trip_confirm_history'].forEach((v) {
        divisionTripConfirmHistory?.add(DivisionTripConfirmHistory.fromJson(v));
      });
    }
    if (json['division_trip_complete_history'] != null) {
      divisionTripCompleteHistory = [];
      json['division_trip_complete_history'].forEach((v) {
        divisionTripCompleteHistory?.add(DivisionTripCompleteHistory.fromJson(v));
      });
    }
    if (json['division_trip_cancel_history'] != null) {
      divisionTripCancelHistory = [];
      json['division_trip_cancel_history'].forEach((v) {
        divisionTripCancelHistory?.add(DivisionTripCancelHistory.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  int? divisionTripConfirmCount;
  int? divisionTripCompleteCount;
  int? divisionTripCancelCount;
  List<DivisionTripConfirmHistory>? divisionTripConfirmHistory;
  List<DivisionTripCompleteHistory>? divisionTripCompleteHistory;
  List<DivisionTripCancelHistory>? divisionTripCancelHistory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['division_trip_confirm_count'] = divisionTripConfirmCount;
    map['division_trip_complete_count'] = divisionTripCompleteCount;
    map['division_trip_cancel_count'] = divisionTripCancelCount;
    if (divisionTripConfirmHistory != null) {
      map['division_trip_confirm_history'] = divisionTripConfirmHistory?.map((v) => v.toJson()).toList();
    }
    if (divisionTripCompleteHistory != null) {
      map['division_trip_complete_history'] = divisionTripCompleteHistory?.map((v) => v.toJson()).toList();
    }
    if (divisionTripCancelHistory != null) {
      map['division_trip_cancel_history'] = divisionTripCancelHistory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DivisionTripCancelHistory {
  DivisionTripCancelHistory({
      this.id, 
      this.tripId, 
      this.vehicleCategory, 
      this.vehicleId, 
      this.customerId, 
      this.partnerId, 
      this.amount, 
      this.extraPrice, 
      this.platformCharge, 
      this.otp, 
      this.trackingId, 
      this.assignedVehicleId, 
      this.driverName, 
      this.driverPhone, 
      this.status, 
      this.cancelType, 
      this.cancelledBy, 
      this.cancelledStatus, 
      this.cancelreasonId, 
      this.cancelCreatedAt, 
      this.tripStarted, 
      this.tripCompleted, 
      this.createdAt, 
      this.updatedAt, 
      this.getTrip, 
      this.getcategory, 
      this.getvehicle,});

  DivisionTripCancelHistory.fromJson(dynamic json) {
    id = json['id'];
    tripId = json['trip_id'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    customerId = json['customer_id'];
    partnerId = json['partner_id'];
    amount = json['amount'];
    extraPrice = json['extra_price'];
    platformCharge = json['platform_charge'];
    otp = json['otp'];
    trackingId = json['tracking_id'];
    assignedVehicleId = json['assigned_vehicle_id'];
    driverName = json['driver_name'];
    driverPhone = json['driver_phone'];
    status = json['status'];
    cancelType = json['cancel_type'];
    cancelledBy = json['cancelled_by'];
    cancelledStatus = json['cancelled_status'];
    cancelreasonId = json['cancelreason_id'];
    cancelCreatedAt = json['cancel_created_at'];
    tripStarted = json['trip_started'];
    tripCompleted = json['trip_completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getTrip = json['get_trip'] != null ? GetTrip.fromJson(json['get_trip']) : null;
    getcategory = json['getcategory'] != null ? Getcategory.fromJson(json['getcategory']) : null;
    getvehicle = json['getvehicle'] != null ? Getvehicle.fromJson(json['getvehicle']) : null;
  }
  int? id;
  int? tripId;
  int? vehicleCategory;
  int? vehicleId;
  int? customerId;
  int? partnerId;
  int? amount;
  int? extraPrice;
  int? platformCharge;
  int? otp;
  String? trackingId;
  int? assignedVehicleId;
  String? driverName;
  String? driverPhone;
  int? status;
  dynamic cancelType;
  dynamic cancelledBy;
  dynamic cancelledStatus;
  dynamic cancelreasonId;
  dynamic cancelCreatedAt;
  int? tripStarted;
  int? tripCompleted;
  String? createdAt;
  String? updatedAt;
  GetTrip? getTrip;
  Getcategory? getcategory;
  Getvehicle? getvehicle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['trip_id'] = tripId;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['customer_id'] = customerId;
    map['partner_id'] = partnerId;
    map['amount'] = amount;
    map['extra_price'] = extraPrice;
    map['platform_charge'] = platformCharge;
    map['otp'] = otp;
    map['tracking_id'] = trackingId;
    map['assigned_vehicle_id'] = assignedVehicleId;
    map['driver_name'] = driverName;
    map['driver_phone'] = driverPhone;
    map['status'] = status;
    map['cancel_type'] = cancelType;
    map['cancelled_by'] = cancelledBy;
    map['cancelled_status'] = cancelledStatus;
    map['cancelreason_id'] = cancelreasonId;
    map['cancel_created_at'] = cancelCreatedAt;
    map['trip_started'] = tripStarted;
    map['trip_completed'] = tripCompleted;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (getTrip != null) {
      map['get_trip'] = getTrip?.toJson();
    }
    if (getcategory != null) {
      map['getcategory'] = getcategory?.toJson();
    }
    if (getvehicle != null) {
      map['getvehicle'] = getvehicle?.toJson();
    }
    return map;
  }

}

class Getvehicle {
  Getvehicle({
      this.id, 
      this.vehicleCategory, 
      this.name, 
      this.nameBn, 
      this.slug, 
      this.capacity, 
      this.image, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Getvehicle.fromJson(dynamic json) {
    id = json['id'];
    vehicleCategory = json['vehicle_category'];
    name = json['name'];
    nameBn = json['name_bn'];
    slug = json['slug'];
    capacity = json['capacity'];
    image = json['image']??'';
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? vehicleCategory;
  String? name;
  String? nameBn;
  String? slug;
  String? capacity;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['vehicle_category'] = vehicleCategory;
    map['name'] = name;
    map['name_bn'] = nameBn;
    map['slug'] = slug;
    map['capacity'] = capacity;
    map['image'] = image;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Getcategory {
  Getcategory({
      this.id, 
      this.name, 
      this.nameBn, 
      this.slug, 
      this.image, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Getcategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    slug = json['slug'];
    image = json['image']??'';
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? nameBn;
  String? slug;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['name_bn'] = nameBn;
    map['slug'] = slug;
    map['image'] = image;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class GetTrip {
  GetTrip({
      this.id, 
      this.uniqueCode, 
      this.partnerId, 
      this.type, 
      this.divisionId, 
      this.pickupTime, 
      this.pickupLocation, 
      this.dropoffLocation, 
      this.vehicleCategory, 
      this.vehicleId, 
      this.assignedVehicleId, 
      this.driverName, 
      this.driverPhone, 
      this.trackingId, 
      this.totalPrice, 
      this.totalCommission, 
      this.promoKey, 
      this.status, 
      this.isDelete, 
      this.createdAt, 
      this.updatedAt, 
      this.expiredAt,});

  GetTrip.fromJson(dynamic json) {
    id = json['id'];
    uniqueCode = json['unique_code'];
    partnerId = json['partner_id'];
    type = json['type'];
    divisionId = json['division_id'];
    pickupTime = json['pickup_time'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    assignedVehicleId = json['assigned_vehicle_id'];
    driverName = json['driver_name'];
    driverPhone = json['driver_phone'];
    trackingId = json['tracking_id'];
    totalPrice = json['total_price'];
    totalCommission = json['total_commission'];
    promoKey = json['promo_key'];
    status = json['status'];
    isDelete = json['is_delete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiredAt = json['expired_at'];
  }
  int? id;
  String? uniqueCode;
  int? partnerId;
  String? type;
  int? divisionId;
  String? pickupTime;
  String? pickupLocation;
  String? dropoffLocation;
  int? vehicleCategory;
  int? vehicleId;
  int? assignedVehicleId;
  String? driverName;
  String? driverPhone;
  String? trackingId;
  int? totalPrice;
  int? totalCommission;
  dynamic promoKey;
  int? status;
  int? isDelete;
  String? createdAt;
  String? updatedAt;
  String? expiredAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['unique_code'] = uniqueCode;
    map['partner_id'] = partnerId;
    map['type'] = type;
    map['division_id'] = divisionId;
    map['pickup_time'] = pickupTime;
    map['pickup_location'] = pickupLocation;
    map['dropoff_location'] = dropoffLocation;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['assigned_vehicle_id'] = assignedVehicleId;
    map['driver_name'] = driverName;
    map['driver_phone'] = driverPhone;
    map['tracking_id'] = trackingId;
    map['total_price'] = totalPrice;
    map['total_commission'] = totalCommission;
    map['promo_key'] = promoKey;
    map['status'] = status;
    map['is_delete'] = isDelete;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['expired_at'] = expiredAt;
    return map;
  }

}

class DivisionTripCompleteHistory {
  DivisionTripCompleteHistory({
      this.id, 
      this.tripId, 
      this.vehicleCategory, 
      this.vehicleId, 
      this.customerId, 
      this.partnerId, 
      this.amount, 
      this.extraPrice, 
      this.platformCharge, 
      this.otp, 
      this.trackingId, 
      this.assignedVehicleId, 
      this.driverName, 
      this.driverPhone, 
      this.status, 
      this.cancelType, 
      this.cancelledBy, 
      this.cancelledStatus, 
      this.cancelreasonId, 
      this.cancelCreatedAt, 
      this.tripStarted, 
      this.tripCompleted, 
      this.createdAt, 
      this.updatedAt, 
      this.getTrip, 
      this.getcategory, 
      this.getvehicle,});

  DivisionTripCompleteHistory.fromJson(dynamic json) {
    id = json['id'];
    tripId = json['trip_id'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    customerId = json['customer_id'];
    partnerId = json['partner_id'];
    amount = json['amount'];
    extraPrice = json['extra_price'];
    platformCharge = json['platform_charge'];
    otp = json['otp'];
    trackingId = json['tracking_id'];
    assignedVehicleId = json['assigned_vehicle_id'];
    driverName = json['driver_name'];
    driverPhone = json['driver_phone'];
    status = json['status'];
    cancelType = json['cancel_type'];
    cancelledBy = json['cancelled_by'];
    cancelledStatus = json['cancelled_status'];
    cancelreasonId = json['cancelreason_id'];
    cancelCreatedAt = json['cancel_created_at'];
    tripStarted = json['trip_started'];
    tripCompleted = json['trip_completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getTrip = json['get_trip'] != null ? GetTrip.fromJson(json['get_trip']) : null;
    getcategory = json['getcategory'] != null ? Getcategory.fromJson(json['getcategory']) : null;
    getvehicle = json['getvehicle'] != null ? Getvehicle.fromJson(json['getvehicle']) : null;
  }
  int? id;
  int? tripId;
  int? vehicleCategory;
  int? vehicleId;
  int? customerId;
  int? partnerId;
  int? amount;
  int? extraPrice;
  int? platformCharge;
  int? otp;
  String? trackingId;
  int? assignedVehicleId;
  String? driverName;
  String? driverPhone;
  int? status;
  dynamic cancelType;
  dynamic cancelledBy;
  dynamic cancelledStatus;
  dynamic cancelreasonId;
  dynamic cancelCreatedAt;
  int? tripStarted;
  int? tripCompleted;
  String? createdAt;
  String? updatedAt;
  GetTrip? getTrip;
  Getcategory? getcategory;
  Getvehicle? getvehicle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['trip_id'] = tripId;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['customer_id'] = customerId;
    map['partner_id'] = partnerId;
    map['amount'] = amount;
    map['extra_price'] = extraPrice;
    map['platform_charge'] = platformCharge;
    map['otp'] = otp;
    map['tracking_id'] = trackingId;
    map['assigned_vehicle_id'] = assignedVehicleId;
    map['driver_name'] = driverName;
    map['driver_phone'] = driverPhone;
    map['status'] = status;
    map['cancel_type'] = cancelType;
    map['cancelled_by'] = cancelledBy;
    map['cancelled_status'] = cancelledStatus;
    map['cancelreason_id'] = cancelreasonId;
    map['cancel_created_at'] = cancelCreatedAt;
    map['trip_started'] = tripStarted;
    map['trip_completed'] = tripCompleted;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (getTrip != null) {
      map['get_trip'] = getTrip?.toJson();
    }
    if (getcategory != null) {
      map['getcategory'] = getcategory?.toJson();
    }
    if (getvehicle != null) {
      map['getvehicle'] = getvehicle?.toJson();
    }
    return map;
  }

}

class DivisionTripConfirmHistory {
  DivisionTripConfirmHistory({
      this.id, 
      this.tripId, 
      this.vehicleCategory, 
      this.vehicleId, 
      this.customerId, 
      this.partnerId, 
      this.amount, 
      this.extraPrice, 
      this.platformCharge, 
      this.otp, 
      this.trackingId, 
      this.assignedVehicleId, 
      this.driverName, 
      this.driverPhone, 
      this.status, 
      this.cancelType, 
      this.cancelledBy, 
      this.cancelledStatus, 
      this.cancelreasonId, 
      this.cancelCreatedAt, 
      this.tripStarted, 
      this.tripCompleted, 
      this.createdAt, 
      this.updatedAt, 
      this.getTrip, 
      this.getcategory, 
      this.getvehicle,});

  DivisionTripConfirmHistory.fromJson(dynamic json) {
    id = json['id'];
    tripId = json['trip_id'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    customerId = json['customer_id'];
    partnerId = json['partner_id'];
    amount = json['amount'];
    extraPrice = json['extra_price'];
    platformCharge = json['platform_charge'];
    otp = json['otp'];
    trackingId = json['tracking_id'];
    assignedVehicleId = json['assigned_vehicle_id'];
    driverName = json['driver_name'];
    driverPhone = json['driver_phone'];
    status = json['status'];
    cancelType = json['cancel_type'];
    cancelledBy = json['cancelled_by'];
    cancelledStatus = json['cancelled_status'];
    cancelreasonId = json['cancelreason_id'];
    cancelCreatedAt = json['cancel_created_at'];
    tripStarted = json['trip_started'];
    tripCompleted = json['trip_completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getTrip = json['get_trip'] != null ? GetTrip.fromJson(json['get_trip']) : null;
    getcategory = json['getcategory'] != null ? Getcategory.fromJson(json['getcategory']) : null;
    getvehicle = json['getvehicle'] != null ? Getvehicle.fromJson(json['getvehicle']) : null;
  }
  int? id;
  int? tripId;
  int? vehicleCategory;
  int? vehicleId;
  int? customerId;
  int? partnerId;
  int? amount;
  int? extraPrice;
  int? platformCharge;
  int? otp;
  String? trackingId;
  int? assignedVehicleId;
  String? driverName;
  String? driverPhone;
  int? status;
  dynamic cancelType;
  dynamic cancelledBy;
  dynamic cancelledStatus;
  dynamic cancelreasonId;
  dynamic cancelCreatedAt;
  int? tripStarted;
  int? tripCompleted;
  String? createdAt;
  String? updatedAt;
  GetTrip? getTrip;
  Getcategory? getcategory;
  Getvehicle? getvehicle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['trip_id'] = tripId;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['customer_id'] = customerId;
    map['partner_id'] = partnerId;
    map['amount'] = amount;
    map['extra_price'] = extraPrice;
    map['platform_charge'] = platformCharge;
    map['otp'] = otp;
    map['tracking_id'] = trackingId;
    map['assigned_vehicle_id'] = assignedVehicleId;
    map['driver_name'] = driverName;
    map['driver_phone'] = driverPhone;
    map['status'] = status;
    map['cancel_type'] = cancelType;
    map['cancelled_by'] = cancelledBy;
    map['cancelled_status'] = cancelledStatus;
    map['cancelreason_id'] = cancelreasonId;
    map['cancel_created_at'] = cancelCreatedAt;
    map['trip_started'] = tripStarted;
    map['trip_completed'] = tripCompleted;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (getTrip != null) {
      map['get_trip'] = getTrip?.toJson();
    }
    if (getcategory != null) {
      map['getcategory'] = getcategory?.toJson();
    }
    if (getvehicle != null) {
      map['getvehicle'] = getvehicle?.toJson();
    }
    return map;
  }

}
