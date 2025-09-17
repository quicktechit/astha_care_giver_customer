class LiveBiddingModel {
  final String? status;
  final List<LiveBidData>? data;

  LiveBiddingModel({
    this.status,
    this.data,
  });

  LiveBiddingModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => LiveBidData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class LiveBidData {
  final int? id;
  final int? tripId;
  final int? customerId;
  final int? partnerId;
  final dynamic vehicleCategory;
  final dynamic vehicleId;
  final dynamic carId;
  final String? amount;
  final int? extraPrice;
  final int? platformCharge;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final Getpartner? getpartner;

  LiveBidData({
    this.id,
    this.tripId,
    this.customerId,
    this.partnerId,
    this.vehicleCategory,
    this.vehicleId,
    this.carId,
    this.amount,
    this.extraPrice,
    this.platformCharge,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.getpartner,
  });

  LiveBidData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        tripId = json['trip_id'] as int?,
        customerId = json['customer_id'] as int?,
        partnerId = json['partner_id'] as int?,
        vehicleCategory = json['vehicle_category'],
        vehicleId = json['vehicle_id'],
        carId = json['car_id'],
        amount = json['amount'] as String?,
        extraPrice = json['extra_price'] as int?,
        platformCharge = json['platform_charge'] as int?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        getpartner = (json['getpartner'] as Map<String,dynamic>?) != null ? Getpartner.fromJson(json['getpartner'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'trip_id' : tripId,
    'customer_id' : customerId,
    'partner_id' : partnerId,
    'vehicle_category' : vehicleCategory,
    'vehicle_id' : vehicleId,
    'car_id' : carId,
    'amount' : amount,
    'extra_price' : extraPrice,
    'platform_charge' : platformCharge,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'getpartner' : getpartner?.toJson()
  };
}

class Getpartner {
  final int? id;
  final String? name;
  final String? phone;
  final dynamic email;
  final String? image;
  final dynamic agencyType;
  final dynamic categoryId;
  final dynamic sizecategoryId;
  final dynamic vehicleId;
  final dynamic truckType;
  final dynamic docType;
  final dynamic docNumber;
  final dynamic docFront;
  final dynamic docBack;
  final String? drivingLicenseFront;
  final dynamic drivingLicenseBack;
  final int? divisionId;
  final int? districtId;
  final dynamic thanaId;
  final String? address;
  final String? gender;
  final dynamic referCode;
  final String? myreferKey;
  final String? verify;
  final dynamic forgotCode;
  final int? credit;
  final int? debit;
  final String? deviceToken;
  final dynamic packageId;
  final dynamic packageStatus;
  final dynamic enableDate;
  final dynamic expireDate;
  final dynamic currentMap;
  final String? googleMapLocation;
  final int? cancelButton;
  final int? cancelCount;
  final dynamic suspendExpiredAt;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Getpartner({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.image,
    this.agencyType,
    this.categoryId,
    this.sizecategoryId,
    this.vehicleId,
    this.truckType,
    this.docType,
    this.docNumber,
    this.docFront,
    this.docBack,
    this.drivingLicenseFront,
    this.drivingLicenseBack,
    this.divisionId,
    this.districtId,
    this.thanaId,
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
    this.googleMapLocation,
    this.cancelButton,
    this.cancelCount,
    this.suspendExpiredAt,
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
        agencyType = json['agency_type'],
        categoryId = json['category_id'],
        sizecategoryId = json['sizecategory_id'],
        vehicleId = json['vehicle_id'],
        truckType = json['truck_type'],
        docType = json['doc_type'],
        docNumber = json['doc_number'],
        docFront = json['doc_front'],
        docBack = json['doc_back'],
        drivingLicenseFront = json['driving_license_front'] as String?,
        drivingLicenseBack = json['driving_license_back'],
        divisionId = json['division_id'] as int?,
        districtId = json['district_id'] as int?,
        thanaId = json['thana_id'],
        address = json['address'] as String?,
        gender = json['gender'] as String?,
        referCode = json['refer_code'],
        myreferKey = json['myrefer_key'] as String?,
        verify = json['verify'] as String?,
        forgotCode = json['forgot_code'],
        credit = json['credit'] as int?,
        debit = json['debit'] as int?,
        deviceToken = json['device_token'] as String?,
        packageId = json['package_id'],
        packageStatus = json['package_status'],
        enableDate = json['enable_date'],
        expireDate = json['expire_date'],
        currentMap = json['current_map'],
        googleMapLocation = json['google_map_location'] as String?,
        cancelButton = json['cancel_button'] as int?,
        cancelCount = json['cancel_count'] as int?,
        suspendExpiredAt = json['suspend_expired_at'],
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'phone' : phone,
    'email' : email,
    'image' : image,
    'agency_type' : agencyType,
    'category_id' : categoryId,
    'sizecategory_id' : sizecategoryId,
    'vehicle_id' : vehicleId,
    'truck_type' : truckType,
    'doc_type' : docType,
    'doc_number' : docNumber,
    'doc_front' : docFront,
    'doc_back' : docBack,
    'driving_license_front' : drivingLicenseFront,
    'driving_license_back' : drivingLicenseBack,
    'division_id' : divisionId,
    'district_id' : districtId,
    'thana_id' : thanaId,
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
    'google_map_location' : googleMapLocation,
    'cancel_button' : cancelButton,
    'cancel_count' : cancelCount,
    'suspend_expired_at' : suspendExpiredAt,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}