class ReturnTripHistoryModel {
  ReturnTripHistoryModel({
      this.status, 
      this.message, 
      this.returnTripConfirmCount, 
      this.returnTripStartCount, 
      this.returnTripCompleteCount, 
      this.returnTripCancelCount, 
      this.returnTripConfirmHistory, 
      this.returnTripStartHistory, 
      this.returnTripCompleteHistory, 
      this.returnTripCancelHistory,});

  ReturnTripHistoryModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    returnTripConfirmCount = json['return_trip_confirm_count'];
    returnTripStartCount = json['return_trip_start_count'];
    returnTripCompleteCount = json['return_trip_complete_count'];
    returnTripCancelCount = json['return_trip_cancel_count'];
    if (json['return_trip_confirm_history'] != null) {
      returnTripConfirmHistory = [];
      json['return_trip_confirm_history'].forEach((v) {
        returnTripConfirmHistory?.add(ReturnTripConfirmHistory.fromJson(v));
      });
    }
    if (json['return_trip_start_history'] != null) {
      returnTripStartHistory = [];
      json['return_trip_start_history'].forEach((v) {
        returnTripStartHistory?.add(ReturnTripStartHistory.fromJson(v));
      });
    }
    if (json['return_trip_complete_history'] != null) {
      returnTripCompleteHistory = [];
      json['return_trip_complete_history'].forEach((v) {
        returnTripCompleteHistory?.add(ReturnTripCompleteHistory.fromJson(v));
      });
    }
    if (json['return_trip_cancel_history'] != null) {
      returnTripCancelHistory = [];
      json['return_trip_cancel_history'].forEach((v) {
        returnTripCancelHistory?.add(ReturnTripCancelHistory.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  int? returnTripConfirmCount;
  int? returnTripStartCount;
  int? returnTripCompleteCount;
  int? returnTripCancelCount;
  List<ReturnTripConfirmHistory>? returnTripConfirmHistory;
  List<ReturnTripStartHistory>? returnTripStartHistory;
  List<ReturnTripCompleteHistory>? returnTripCompleteHistory;
  List<ReturnTripCancelHistory>? returnTripCancelHistory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['return_trip_confirm_count'] = returnTripConfirmCount;
    map['return_trip_start_count'] = returnTripStartCount;
    map['return_trip_complete_count'] = returnTripCompleteCount;
    map['return_trip_cancel_count'] = returnTripCancelCount;
    if (returnTripConfirmHistory != null) {
      map['return_trip_confirm_history'] = returnTripConfirmHistory?.map((v) => v.toJson()).toList();
    }
    if (returnTripStartHistory != null) {
      map['return_trip_start_history'] = returnTripStartHistory?.map((v) => v.toJson()).toList();
    }
    if (returnTripCompleteHistory != null) {
      map['return_trip_complete_history'] = returnTripCompleteHistory?.map((v) => v.toJson()).toList();
    }
    if (returnTripCancelHistory != null) {
      map['return_trip_cancel_history'] = returnTripCancelHistory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ReturnTripCancelHistory {
  ReturnTripCancelHistory({
      this.id, 
      this.tripId, 
      this.bidId, 
      this.vehicleCategory, 
      this.vehicleId, 
      this.pickupLocation, 
      this.dropoffLocation, 
      this.partnerId, 
      this.customerId, 
      this.timedate, 
      this.amount, 
      this.otp, 
      this.trackingId, 
      this.status, 
      this.cancelType, 
      this.cancelledStatus, 
      this.cancelledBy, 
      this.cancelreasonId, 
      this.cancelCreatedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.getTrip, 
      this.getcategory, 
      this.getvehicle,});

  ReturnTripCancelHistory.fromJson(dynamic json) {
    id = json['id'];
    tripId = json['trip_id'];
    bidId = json['bid_id'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    partnerId = json['partner_id'];
    customerId = json['customer_id'];
    timedate = json['timedate'];
    amount = json['amount'];
    otp = json['otp'];
    trackingId = json['tracking_id'];
    status = json['status'];
    cancelType = json['cancel_type'];
    cancelledStatus = json['cancelled_status'];
    cancelledBy = json['cancelled_by'];
    cancelreasonId = json['cancelreason_id'];
    cancelCreatedAt = json['cancel_created_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getTrip = json['get_trip'] != null ? GetTrip.fromJson(json['get_trip']) : null;
    getcategory = json['getcategory'] != null ? Getcategory.fromJson(json['getcategory']) : null;
    getvehicle = json['getvehicle'] != null ? Getvehicle.fromJson(json['getvehicle']) : null;
  }
  int? id;
  int? tripId;
  int? bidId;
  int? vehicleCategory;
  int? vehicleId;
  String? pickupLocation;
  String? dropoffLocation;
  int? partnerId;
  int? customerId;
  String? timedate;
  String? amount;
  int? otp;
  String? trackingId;
  int? status;
  String? cancelType;
  int? cancelledStatus;
  int? cancelledBy;
  int? cancelreasonId;
  String? cancelCreatedAt;
  String? createdAt;
  String? updatedAt;
  GetTrip? getTrip;
  Getcategory? getcategory;
  Getvehicle? getvehicle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['trip_id'] = tripId;
    map['bid_id'] = bidId;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['pickup_location'] = pickupLocation;
    map['dropoff_location'] = dropoffLocation;
    map['partner_id'] = partnerId;
    map['customer_id'] = customerId;
    map['timedate'] = timedate;
    map['amount'] = amount;
    map['otp'] = otp;
    map['tracking_id'] = trackingId;
    map['status'] = status;
    map['cancel_type'] = cancelType;
    map['cancelled_status'] = cancelledStatus;
    map['cancelled_by'] = cancelledBy;
    map['cancelreason_id'] = cancelreasonId;
    map['cancel_created_at'] = cancelCreatedAt;
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
    map['image'] = image??'';
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
      this.pickupDivision, 
      this.dropoffDivision, 
      this.location, 
      this.destination, 
      this.amount, 
      this.timedate, 
      this.partnerId, 
      this.vehicleCategory, 
      this.vehicleId, 
      this.biding, 
      this.trackingId, 
      this.assignedVehicleId, 
      this.assignedDriverId, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  GetTrip.fromJson(dynamic json) {
    id = json['id'];
    pickupDivision = json['pickup_division'];
    dropoffDivision = json['dropoff_division'];
    location = json['location'];
    destination = json['destination'];
    amount = json['amount'];
    timedate = json['timedate'];
    partnerId = json['partner_id'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    biding = json['biding'];
    trackingId = json['tracking_id'];
    assignedVehicleId = json['assigned_vehicle_id'];
    assignedDriverId = json['assigned_driver_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? pickupDivision;
  int? dropoffDivision;
  String? location;
  String? destination;
  String? amount;
  String? timedate;
  int? partnerId;
  int? vehicleCategory;
  int? vehicleId;
  int? biding;
  String? trackingId;
  int? assignedVehicleId;
  int? assignedDriverId;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['pickup_division'] = pickupDivision;
    map['dropoff_division'] = dropoffDivision;
    map['location'] = location;
    map['destination'] = destination;
    map['amount'] = amount;
    map['timedate'] = timedate;
    map['partner_id'] = partnerId;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['biding'] = biding;
    map['tracking_id'] = trackingId;
    map['assigned_vehicle_id'] = assignedVehicleId;
    map['assigned_driver_id'] = assignedDriverId;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class ReturnTripCompleteHistory {
  ReturnTripCompleteHistory({
      this.id, 
      this.tripId, 
      this.bidId, 
      this.vehicleCategory, 
      this.vehicleId, 
      this.pickupLocation, 
      this.dropoffLocation, 
      this.partnerId, 
      this.customerId, 
      this.timedate, 
      this.amount, 
      this.otp, 
      this.trackingId, 
      this.status, 
      this.cancelType, 
      this.cancelledStatus, 
      this.cancelledBy, 
      this.cancelreasonId, 
      this.cancelCreatedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.getTrip, 
      this.getcategory, 
      this.getvehicle,});

  ReturnTripCompleteHistory.fromJson(dynamic json) {
    id = json['id'];
    tripId = json['trip_id'];
    bidId = json['bid_id'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    partnerId = json['partner_id'];
    customerId = json['customer_id'];
    timedate = json['timedate'];
    amount = json['amount'];
    otp = json['otp'];
    trackingId = json['tracking_id'];
    status = json['status'];
    cancelType = json['cancel_type'];
    cancelledStatus = json['cancelled_status'];
    cancelledBy = json['cancelled_by'];
    cancelreasonId = json['cancelreason_id'];
    cancelCreatedAt = json['cancel_created_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getTrip = json['get_trip'] != null ? GetTrip.fromJson(json['get_trip']) : null;
    getcategory = json['getcategory'] != null ? Getcategory.fromJson(json['getcategory']) : null;
    getvehicle = json['getvehicle'] != null ? Getvehicle.fromJson(json['getvehicle']) : null;
  }
  int? id;
  int? tripId;
  int? bidId;
  int? vehicleCategory;
  int? vehicleId;
  String? pickupLocation;
  String? dropoffLocation;
  int? partnerId;
  int? customerId;
  String? timedate;
  String? amount;
  int? otp;
  String? trackingId;
  int? status;
  dynamic cancelType;
  dynamic cancelledStatus;
  dynamic cancelledBy;
  dynamic cancelreasonId;
  dynamic cancelCreatedAt;
  String? createdAt;
  String? updatedAt;
  GetTrip? getTrip;
  Getcategory? getcategory;
  Getvehicle? getvehicle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['trip_id'] = tripId;
    map['bid_id'] = bidId;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['pickup_location'] = pickupLocation;
    map['dropoff_location'] = dropoffLocation;
    map['partner_id'] = partnerId;
    map['customer_id'] = customerId;
    map['timedate'] = timedate;
    map['amount'] = amount;
    map['otp'] = otp;
    map['tracking_id'] = trackingId;
    map['status'] = status;
    map['cancel_type'] = cancelType;
    map['cancelled_status'] = cancelledStatus;
    map['cancelled_by'] = cancelledBy;
    map['cancelreason_id'] = cancelreasonId;
    map['cancel_created_at'] = cancelCreatedAt;
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

class ReturnTripStartHistory {
  ReturnTripStartHistory({
      this.id, 
      this.tripId, 
      this.bidId, 
      this.vehicleCategory, 
      this.vehicleId, 
      this.pickupLocation, 
      this.dropoffLocation, 
      this.partnerId, 
      this.customerId, 
      this.timedate, 
      this.amount, 
      this.otp, 
      this.trackingId, 
      this.status, 
      this.cancelType, 
      this.cancelledStatus, 
      this.cancelledBy, 
      this.cancelreasonId, 
      this.cancelCreatedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.getTrip, 
      this.getcategory, 
      this.getvehicle,});

  ReturnTripStartHistory.fromJson(dynamic json) {
    id = json['id'];
    tripId = json['trip_id'];
    bidId = json['bid_id'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    partnerId = json['partner_id'];
    customerId = json['customer_id'];
    timedate = json['timedate'];
    amount = json['amount'];
    otp = json['otp'];
    trackingId = json['tracking_id'];
    status = json['status'];
    cancelType = json['cancel_type'];
    cancelledStatus = json['cancelled_status'];
    cancelledBy = json['cancelled_by'];
    cancelreasonId = json['cancelreason_id'];
    cancelCreatedAt = json['cancel_created_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getTrip = json['get_trip'] != null ? GetTrip.fromJson(json['get_trip']) : null;
    getcategory = json['getcategory'] != null ? Getcategory.fromJson(json['getcategory']) : null;
    getvehicle = json['getvehicle'] != null ? Getvehicle.fromJson(json['getvehicle']) : null;
  }
  int? id;
  int? tripId;
  int? bidId;
  int? vehicleCategory;
  int? vehicleId;
  String? pickupLocation;
  String? dropoffLocation;
  int? partnerId;
  int? customerId;
  String? timedate;
  String? amount;
  int? otp;
  String? trackingId;
  int? status;
  dynamic cancelType;
  dynamic cancelledStatus;
  dynamic cancelledBy;
  dynamic cancelreasonId;
  dynamic cancelCreatedAt;
  String? createdAt;
  String? updatedAt;
  GetTrip? getTrip;
  Getcategory? getcategory;
  Getvehicle? getvehicle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['trip_id'] = tripId;
    map['bid_id'] = bidId;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['pickup_location'] = pickupLocation;
    map['dropoff_location'] = dropoffLocation;
    map['partner_id'] = partnerId;
    map['customer_id'] = customerId;
    map['timedate'] = timedate;
    map['amount'] = amount;
    map['otp'] = otp;
    map['tracking_id'] = trackingId;
    map['status'] = status;
    map['cancel_type'] = cancelType;
    map['cancelled_status'] = cancelledStatus;
    map['cancelled_by'] = cancelledBy;
    map['cancelreason_id'] = cancelreasonId;
    map['cancel_created_at'] = cancelCreatedAt;
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

class ReturnTripConfirmHistory {
  ReturnTripConfirmHistory({
      this.id, 
      this.tripId, 
      this.bidId, 
      this.vehicleCategory, 
      this.vehicleId, 
      this.pickupLocation, 
      this.dropoffLocation, 
      this.partnerId, 
      this.customerId, 
      this.timedate, 
      this.amount, 
      this.otp, 
      this.trackingId, 
      this.status, 
      this.cancelType, 
      this.cancelledStatus, 
      this.cancelledBy, 
      this.cancelreasonId, 
      this.cancelCreatedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.getTrip, 
      this.getcategory, 
      this.getvehicle,});

  ReturnTripConfirmHistory.fromJson(dynamic json) {
    id = json['id'];
    tripId = json['trip_id'];
    bidId = json['bid_id'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    partnerId = json['partner_id'];
    customerId = json['customer_id'];
    timedate = json['timedate'];
    amount = json['amount'];
    otp = json['otp'];
    trackingId = json['tracking_id'];
    status = json['status'];
    cancelType = json['cancel_type'];
    cancelledStatus = json['cancelled_status'];
    cancelledBy = json['cancelled_by'];
    cancelreasonId = json['cancelreason_id'];
    cancelCreatedAt = json['cancel_created_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getTrip = json['get_trip'] != null ? GetTrip.fromJson(json['get_trip']) : null;
    getcategory = json['getcategory'] != null ? Getcategory.fromJson(json['getcategory']) : null;
    getvehicle = json['getvehicle'] != null ? Getvehicle.fromJson(json['getvehicle']) : null;
  }
  int? id;
  int? tripId;
  int? bidId;
  int? vehicleCategory;
  int? vehicleId;
  String? pickupLocation;
  String? dropoffLocation;
  int? partnerId;
  int? customerId;
  String? timedate;
  String? amount;
  int? otp;
  String? trackingId;
  int? status;
  dynamic cancelType;
  dynamic cancelledStatus;
  dynamic cancelledBy;
  dynamic cancelreasonId;
  dynamic cancelCreatedAt;
  String? createdAt;
  String? updatedAt;
  GetTrip? getTrip;
  Getcategory? getcategory;
  Getvehicle? getvehicle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['trip_id'] = tripId;
    map['bid_id'] = bidId;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['pickup_location'] = pickupLocation;
    map['dropoff_location'] = dropoffLocation;
    map['partner_id'] = partnerId;
    map['customer_id'] = customerId;
    map['timedate'] = timedate;
    map['amount'] = amount;
    map['otp'] = otp;
    map['tracking_id'] = trackingId;
    map['status'] = status;
    map['cancel_type'] = cancelType;
    map['cancelled_status'] = cancelledStatus;
    map['cancelled_by'] = cancelledBy;
    map['cancelreason_id'] = cancelreasonId;
    map['cancel_created_at'] = cancelCreatedAt;
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

