class SingleDivisionTripDetailsModel {
  final String? status;
  final Data? data;

  SingleDivisionTripDetailsModel({
    this.status,
    this.data,
  });

  SingleDivisionTripDetailsModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.toJson()
  };
}

class Data {
  final TripHistory? tripHistory;

  Data({
    this.tripHistory,
  });

  Data.fromJson(Map<String, dynamic> json)
      : tripHistory = (json['trip_history'] as Map<String,dynamic>?) != null ? TripHistory.fromJson(json['trip_history'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'trip_history' : tripHistory?.toJson()
  };
}

class TripHistory {
  final int? id;
  final String? uniqueCode;
  final int? partnerId;
  final String? type;
  final int? divisionId;
  final String? pickupTime;
  final String? pickupLocation;
  final String? dropoffLocation;
  final int? vehicleCategory;
  final int? vehicleId;
  final int? assignedVehicleId;
  final String? driverName;
  final String? driverPhone;
  final String? trackingId;
  final int? totalPrice;
  final int? totalCommission;
  final dynamic promoKey;
  final int? status;
  final int? isDelete;
  final String? createdAt;
  final String? updatedAt;
  final String? expiredAt;
  final Getvehicle? getvehicle;
  final Getpartner? getpartner;
  final dynamic getConfirmTrip;

  TripHistory({
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
    this.expiredAt,
    this.getvehicle,
    this.getpartner,
    this.getConfirmTrip,
  });

  TripHistory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        uniqueCode = json['unique_code'] as String?,
        partnerId = json['partner_id'] as int?,
        type = json['type'] as String?,
        divisionId = json['division_id'] as int?,
        pickupTime = json['pickup_time'] as String?,
        pickupLocation = json['pickup_location'] as String?,
        dropoffLocation = json['dropoff_location'] as String?,
        vehicleCategory = json['vehicle_category'] as int?,
        vehicleId = json['vehicle_id'] as int?,
        assignedVehicleId = json['assigned_vehicle_id'] as int?,
        driverName = json['driver_name'] as String?,
        driverPhone = json['driver_phone'] as String?,
        trackingId = json['tracking_id'] as String?,
        totalPrice = json['total_price'] as int?,
        totalCommission = json['total_commission'] as int?,
        promoKey = json['promo_key'],
        status = json['status'] as int?,
        isDelete = json['is_delete'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        expiredAt = json['expired_at'] as String?,
        getvehicle = (json['getvehicle'] as Map<String,dynamic>?) != null ? Getvehicle.fromJson(json['getvehicle'] as Map<String,dynamic>) : null,
        getpartner = (json['getpartner'] as Map<String,dynamic>?) != null ? Getpartner.fromJson(json['getpartner'] as Map<String,dynamic>) : null,
        getConfirmTrip = json['get_confirm_trip'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'unique_code' : uniqueCode,
    'partner_id' : partnerId,
    'type' : type,
    'division_id' : divisionId,
    'pickup_time' : pickupTime,
    'pickup_location' : pickupLocation,
    'dropoff_location' : dropoffLocation,
    'vehicle_category' : vehicleCategory,
    'vehicle_id' : vehicleId,
    'assigned_vehicle_id' : assignedVehicleId,
    'driver_name' : driverName,
    'driver_phone' : driverPhone,
    'tracking_id' : trackingId,
    'total_price' : totalPrice,
    'total_commission' : totalCommission,
    'promo_key' : promoKey,
    'status' : status,
    'is_delete' : isDelete,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'expired_at' : expiredAt,
    'getvehicle' : getvehicle?.toJson(),
    'getpartner' : getpartner?.toJson(),
    'get_confirm_trip' : getConfirmTrip
  };
}

class Getvehicle {
  final int? id;
  final int? vehicleCategory;
  final String? name;
  final String? nameBn;
  final String? slug;
  final String? capacity;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

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
    this.updatedAt,
  });

  Getvehicle.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        vehicleCategory = json['vehicle_category'] as int?,
        name = json['name'] as String?,
        nameBn = json['name_bn'] as String?,
        slug = json['slug'] as String?,
        capacity = json['capacity'] as String?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'vehicle_category' : vehicleCategory,
    'name' : name,
    'name_bn' : nameBn,
    'slug' : slug,
    'capacity' : capacity,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Getpartner {
  final int? id;
  final String? name;
  final String? phone;
  final dynamic email;
  final String? image;
  final String? type;
  final int? categoryId;
  final dynamic vehicleCategories;
  final int? vehicleId;
  final String? docType;
  final String? docNumber;
  final dynamic docFront;
  final dynamic docBack;
  final dynamic licenceNo;
  final String? licenceFront;
  final String? licenceBack;
  final String? nidFront;
  final String? nidBack;
  final String? tradeLicence;
  final int? divisionId;
  final int? districtId;
  final dynamic upazilaId;
  final dynamic thanaId;
  final dynamic unionId;
  final String? address;
  final String? gender;
  final dynamic referCode;
  final String? myreferKey;
  final String? verify;
  final dynamic forgotCode;
  final int? credit;
  final int? debit;
  final String? deviceToken;
  final int? packageId;
  final int? packageStatus;
  final String? enableDate;
  final String? expireDate;
  final dynamic currentMap;
  final int? cancelCount;
  final dynamic suspendExpiredAt;
  final int? notificationStatus;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Getpartner({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.image,
    this.type,
    this.categoryId,
    this.vehicleCategories,
    this.vehicleId,
    this.docType,
    this.docNumber,
    this.docFront,
    this.docBack,
    this.licenceNo,
    this.licenceFront,
    this.licenceBack,
    this.nidFront,
    this.nidBack,
    this.tradeLicence,
    this.divisionId,
    this.districtId,
    this.upazilaId,
    this.thanaId,
    this.unionId,
    this.address,
    this.gender,
    this.referCode,
    this.myreferKey,
    this.verify,
    this.forgotCode,
    this.credit,
    this.debit,
    this.deviceToken,
    this.packageId,
    this.packageStatus,
    this.enableDate,
    this.expireDate,
    this.currentMap,
    this.cancelCount,
    this.suspendExpiredAt,
    this.notificationStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Getpartner.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        phone = json['phone'] as String?,
        email = json['email'],
        image = json['image'] as String?,
        type = json['type'] as String?,
        categoryId = json['category_id'] as int?,
        vehicleCategories = json['vehicle_categories'],
        vehicleId = json['vehicle_id'] as int?,
        docType = json['doc_type'] as String?,
        docNumber = json['doc_number'] as String?,
        docFront = json['doc_front'],
        docBack = json['doc_back'],
        licenceNo = json['licence_no'],
        licenceFront = json['licence_front'] as String?,
        licenceBack = json['licence_back'] as String?,
        nidFront = json['nid_front'] as String?,
        nidBack = json['nid_back'] as String?,
        tradeLicence = json['trade_licence'] as String?,
        divisionId = json['division_id'] as int?,
        districtId = json['district_id'] as int?,
        upazilaId = json['upazila_id'],
        thanaId = json['thana_id'],
        unionId = json['union_id'],
        address = json['address'] as String?,
        gender = json['gender'] as String?,
        referCode = json['refer_code'],
        myreferKey = json['myrefer_key'] as String?,
        verify = json['verify'] as String?,
        forgotCode = json['forgot_code'],
        credit = json['credit'] as int?,
        debit = json['debit'] as int?,
        deviceToken = json['device_token'] as String?,
        packageId = json['package_id'] as int?,
        packageStatus = json['package_status'] as int?,
        enableDate = json['enable_date'] as String?,
        expireDate = json['expire_date'] as String?,
        currentMap = json['current_map'],
        cancelCount = json['cancel_count'] as int?,
        suspendExpiredAt = json['suspend_expired_at'],
        notificationStatus = json['notification_status'] as int?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'phone' : phone,
    'email' : email,
    'image' : image,
    'type' : type,
    'category_id' : categoryId,
    'vehicle_categories' : vehicleCategories,
    'vehicle_id' : vehicleId,
    'doc_type' : docType,
    'doc_number' : docNumber,
    'doc_front' : docFront,
    'doc_back' : docBack,
    'licence_no' : licenceNo,
    'licence_front' : licenceFront,
    'licence_back' : licenceBack,
    'nid_front' : nidFront,
    'nid_back' : nidBack,
    'trade_licence' : tradeLicence,
    'division_id' : divisionId,
    'district_id' : districtId,
    'upazila_id' : upazilaId,
    'thana_id' : thanaId,
    'union_id' : unionId,
    'address' : address,
    'gender' : gender,
    'refer_code' : referCode,
    'myrefer_key' : myreferKey,
    'verify' : verify,
    'forgot_code' : forgotCode,
    'credit' : credit,
    'debit' : debit,
    'device_token' : deviceToken,
    'package_id' : packageId,
    'package_status' : packageStatus,
    'enable_date' : enableDate,
    'expire_date' : expireDate,
    'current_map' : currentMap,
    'cancel_count' : cancelCount,
    'suspend_expired_at' : suspendExpiredAt,
    'notification_status' : notificationStatus,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}