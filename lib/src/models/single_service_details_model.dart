class SingleServiceModel {
  final String? status;
  final Data? data;

  SingleServiceModel({
    this.status,
    this.data,
  });

  SingleServiceModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.toJson()
  };
}

class Data {
  final TripHistory? tripHistory;
  final Partner? partner;

  Data({
    this.tripHistory,
    this.partner,
  });

  Data.fromJson(Map<String, dynamic> json)
      : tripHistory = (json['trip_history'] as Map<String,dynamic>?) != null ? TripHistory.fromJson(json['trip_history'] as Map<String,dynamic>) : null,
        partner = (json['partner'] as Map<String,dynamic>?) != null ? Partner.fromJson(json['partner'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'trip_history' : tripHistory?.toJson(),
    'partner' : partner?.toJson()
  };
}

class TripHistory {
  final int? id;
  final String? name;
  final String? age;
  final String? gender;
  final dynamic isDaily;
  final dynamic days;
  final int? isWeekly;
  final int? weeks;
  final dynamic isMonthly;
  final dynamic months;
  final int? customerId;
  final int? serviceId;
  final String? pickupLocation;
  final String? pickupDivision;
  final dynamic dropoffDivision;
  final dynamic isHourly;
  final dynamic hours;
  final String? map;
  final String? datetime;
  final dynamic note;
  final String? trackingId;
  final int? status;
  final int? biding;
  final String? bidingExpiredAt;
  final int? isCancel;
  final int? cancelreasonId;
  final String? createdAt;
  final String? updatedAt;
  final int? otp;
  final int? partnerId;
  final dynamic assignedDriverId;
  final TripConfirm? tripConfirm;
  final AgencyService? agencyService;

  TripHistory({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.isDaily,
    this.days,
    this.isWeekly,
    this.weeks,
    this.isMonthly,
    this.months,
    this.customerId,
    this.serviceId,
    this.pickupLocation,
    this.pickupDivision,
    this.dropoffDivision,
    this.isHourly,
    this.hours,
    this.map,
    this.datetime,
    this.note,
    this.trackingId,
    this.status,
    this.biding,
    this.bidingExpiredAt,
    this.isCancel,
    this.cancelreasonId,
    this.createdAt,
    this.updatedAt,
    this.otp,
    this.partnerId,
    this.assignedDriverId,
    this.tripConfirm,
    this.agencyService,
  });

  TripHistory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        age = json['age'] as String?,
        gender = json['gender'] as String?,
        isDaily = json['is_daily'],
        days = json['days'],
        isWeekly = json['is_weekly'] as int?,
        weeks = json['weeks'] as int?,
        isMonthly = json['is_monthly'],
        months = json['months'],
        customerId = json['customer_id'] as int?,
        serviceId = json['service_id'] as int?,
        pickupLocation = json['pickup_location'] as String?,
        pickupDivision = json['pickup_division'] as String?,
        dropoffDivision = json['dropoff_division'],
        isHourly = json['is_hourly'],
        hours = json['hours'],
        map = json['map'] as String?,
        datetime = json['datetime'] as String?,
        note = json['note'],
        trackingId = json['tracking_id'] as String?,
        status = json['status'] as int?,
        biding = json['biding'] as int?,
        bidingExpiredAt = json['biding_expired_at'] as String?,
        isCancel = json['is_cancel'] as int?,
        cancelreasonId = json['cancelreason_id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        otp = json['otp'] as int?,
        partnerId = json['partner_id'] as int?,
        assignedDriverId = json['assigned_driver_id'],
        tripConfirm = (json['trip_confirm'] as Map<String,dynamic>?) != null ? TripConfirm.fromJson(json['trip_confirm'] as Map<String,dynamic>) : null,
        agencyService = (json['agency_service'] as Map<String,dynamic>?) != null ? AgencyService.fromJson(json['agency_service'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'age' : age,
    'gender' : gender,
    'is_daily' : isDaily,
    'days' : days,
    'is_weekly' : isWeekly,
    'weeks' : weeks,
    'is_monthly' : isMonthly,
    'months' : months,
    'customer_id' : customerId,
    'service_id' : serviceId,
    'pickup_location' : pickupLocation,
    'pickup_division' : pickupDivision,
    'dropoff_division' : dropoffDivision,
    'is_hourly' : isHourly,
    'hours' : hours,
    'map' : map,
    'datetime' : datetime,
    'note' : note,
    'tracking_id' : trackingId,
    'status' : status,
    'biding' : biding,
    'biding_expired_at' : bidingExpiredAt,
    'is_cancel' : isCancel,
    'cancelreason_id' : cancelreasonId,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'otp' : otp,
    'partner_id' : partnerId,
    'assigned_driver_id' : assignedDriverId,
    'trip_confirm' : tripConfirm?.toJson(),
    'agency_service' : agencyService?.toJson()
  };
}

class TripConfirm {
  final int? id;
  final int? tripId;
  final int? bidId;
  final int? customerId;
  final int? partnerId;
  final int? amount;
  final int? extraPrice;
  final int? platformCharge;
  final int? otp;
  final String? trackingId;
  final int? status;
  final String? cancelType;
  final int? cancelledBy;
  final int? cancelledStatus;
  final int? cancelreasonId;
  final String? cancelCreatedAt;
  final int? tripStarted;
  final String? createdAt;
  final String? updatedAt;
  final dynamic cancelReason;

  TripConfirm({
    this.id,
    this.tripId,
    this.bidId,
    this.customerId,
    this.partnerId,
    this.amount,
    this.extraPrice,
    this.platformCharge,
    this.otp,
    this.trackingId,
    this.status,
    this.cancelType,
    this.cancelledBy,
    this.cancelledStatus,
    this.cancelreasonId,
    this.cancelCreatedAt,
    this.tripStarted,
    this.createdAt,
    this.updatedAt,
    this.cancelReason,
  });

  TripConfirm.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        tripId = json['trip_id'] as int?,
        bidId = json['bid_id'] as int?,
        customerId = json['customer_id'] as int?,
        partnerId = json['partner_id'] as int?,
        amount = json['amount'] as int?,
        extraPrice = json['extra_price'] as int?,
        platformCharge = json['platform_charge'] as int?,
        otp = json['otp'] as int?,
        trackingId = json['tracking_id'] as String?,
        status = json['status'] as int?,
        cancelType = json['cancel_type'] as String?,
        cancelledBy = json['cancelled_by'] as int?,
        cancelledStatus = json['cancelled_status'] as int?,
        cancelreasonId = json['cancelreason_id'] as int?,
        cancelCreatedAt = json['cancel_created_at'] as String?,
        tripStarted = json['trip_started'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        cancelReason = json['cancel_reason'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'trip_id' : tripId,
    'bid_id' : bidId,
    'customer_id' : customerId,
    'partner_id' : partnerId,
    'amount' : amount,
    'extra_price' : extraPrice,
    'platform_charge' : platformCharge,
    'otp' : otp,
    'tracking_id' : trackingId,
    'status' : status,
    'cancel_type' : cancelType,
    'cancelled_by' : cancelledBy,
    'cancelled_status' : cancelledStatus,
    'cancelreason_id' : cancelreasonId,
    'cancel_created_at' : cancelCreatedAt,
    'trip_started' : tripStarted,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'cancel_reason' : cancelReason
  };
}

class AgencyService {
  final int? id;
  final String? agencyType;
  final String? image;
  final int? commission;
  final String? createdAt;
  final String? updatedAt;

  AgencyService({
    this.id,
    this.agencyType,
    this.image,
    this.commission,
    this.createdAt,
    this.updatedAt,
  });

  AgencyService.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        agencyType = json['agency_type'] as String?,
        image = json['image'] as String?,
        commission = json['commission'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'agency_type' : agencyType,
    'image' : image,
    'commission' : commission,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Partner {
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
  final dynamic deviceToken;
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

  Partner({
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

  Partner.fromJson(Map<String, dynamic> json)
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
        deviceToken = json['device_token'],
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