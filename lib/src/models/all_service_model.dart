class AllServiceModel {
  final String? status;
  final String? message;
  final List<SortedTrips>? sortedTrips;

  AllServiceModel({
    this.status,
    this.message,
    this.sortedTrips,
  });

  AllServiceModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        message = json['message'] as String?,
        sortedTrips = (json['sorted_trips'] as List?)?.map((dynamic e) => SortedTrips.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'sorted_trips' : sortedTrips?.map((e) => e.toJson()).toList()
  };
}

class SortedTrips {
  final int? id;
  final int? tripId;
  final int? bidId;
  final int? customerId;
  final int? partnerId;
  final String? amount;
  final int? extraPrice;
  final int? platformCharge;
  final int? otp;
  final String? trackingId;
  final int? status;
  final dynamic cancelType;
  final dynamic cancelledBy;
  final dynamic cancelledStatus;
  final dynamic cancelreasonId;
  final dynamic cancelCreatedAt;
  final int? tripStarted;
  final String? createdAt;
  final String? updatedAt;
  final String? source;
  final Getcustomer? getcustomer;
  final Getpartner? getpartner;
  final GetTrip? getTrip;

  SortedTrips({
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
    this.source,
    this.getcustomer,
    this.getpartner,
    this.getTrip,
  });

  SortedTrips.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        tripId = json['trip_id'] as int?,
        bidId = json['bid_id'] as int?,
        customerId = json['customer_id'] as int?,
        partnerId = json['partner_id'] as int?,
        amount = json['amount'].toString(),
        extraPrice = json['extra_price'] as int?,
        platformCharge = json['platform_charge'] as int?,
        otp = json['otp'] as int?,
        trackingId = json['tracking_id'] as String?,
        status = json['status'] as int?,
        cancelType = json['cancel_type'],
        cancelledBy = json['cancelled_by'],
        cancelledStatus = json['cancelled_status'],
        cancelreasonId = json['cancelreason_id'],
        cancelCreatedAt = json['cancel_created_at'],
        tripStarted = json['trip_started'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        source = json['source'] as String?,
        getcustomer = (json['getcustomer'] as Map<String,dynamic>?) != null ? Getcustomer.fromJson(json['getcustomer'] as Map<String,dynamic>) : null,
        getpartner = (json['getpartner'] as Map<String,dynamic>?) != null ? Getpartner.fromJson(json['getpartner'] as Map<String,dynamic>) : null,
        getTrip = (json['get_trip'] as Map<String,dynamic>?) != null ? GetTrip.fromJson(json['get_trip'] as Map<String,dynamic>) : null;

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
    'source' : source,
    'getcustomer' : getcustomer?.toJson(),
    'getpartner' : getpartner?.toJson(),
    'get_trip' : getTrip?.toJson()
  };
}

class Getcustomer {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? birthday;
  final String? gender;
  final String? district;
  final String? address;
  final dynamic image;
  final String? verify;
  final String? expireAt;
  final dynamic forgotCode;
  final int? cancelCount;
  final dynamic suspendExpiredAt;
  final int? status;
  final dynamic deviceToken;
  final String? createdAt;
  final String? updatedAt;

  Getcustomer({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.birthday,
    this.gender,
    this.district,
    this.address,
    this.image,
    this.verify,
    this.expireAt,
    this.forgotCode,
    this.cancelCount,
    this.suspendExpiredAt,
    this.status,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
  });

  Getcustomer.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        phone = json['phone'] as String?,
        email = json['email'] as String?,
        birthday = json['birthday'] as String?,
        gender = json['gender'] as String?,
        district = json['district'] as String?,
        address = json['address'] as String?,
        image = json['image'],
        verify = json['verify'] as String?,
        expireAt = json['expire_at'] as String?,
        forgotCode = json['forgot_code'],
        cancelCount = json['cancel_count'] as int?,
        suspendExpiredAt = json['suspend_expired_at'],
        status = json['status'] as int?,
        deviceToken = json['device_token'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'phone' : phone,
    'email' : email,
    'birthday' : birthday,
    'gender' : gender,
    'district' : district,
    'address' : address,
    'image' : image,
    'verify' : verify,
    'expire_at' : expireAt,
    'forgot_code' : forgotCode,
    'cancel_count' : cancelCount,
    'suspend_expired_at' : suspendExpiredAt,
    'status' : status,
    'device_token' : deviceToken,
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

class GetTrip {
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
  final dynamic categoryId;
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
  final dynamic cancelreasonId;
  final String? createdAt;
  final String? updatedAt;
  final AgencyService? agencyService;

  GetTrip({
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
    this.categoryId,
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
    this.agencyService,
  });

  GetTrip.fromJson(Map<String, dynamic> json)
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
        categoryId = json['category_id'],
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
        cancelreasonId = json['cancelreason_id'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
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
    'category_id' : categoryId,
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
    'agency_service' : agencyService?.toJson()
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