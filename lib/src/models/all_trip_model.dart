class SortingAllTripModel {
  final String? status;
  final String? message;
  final int? totalCount;
  final Counts? counts;
  final List<SortedTrips>? sortedTrips;

  SortingAllTripModel({
    this.status,
    this.message,
    this.totalCount,
    this.counts,
    this.sortedTrips,
  });

  SortingAllTripModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        message = json['message'] as String?,
        totalCount = json['total_count'] as int?,
        counts = (json['counts'] as Map<String,dynamic>?) != null ? Counts.fromJson(json['counts'] as Map<String,dynamic>) : null,
        sortedTrips = (json['sorted_trips'] as List?)?.map((dynamic e) => SortedTrips.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'total_count' : totalCount,
    'counts' : counts?.toJson(),
    'sorted_trips' : sortedTrips?.map((e) => e.toJson()).toList()
  };
}

class Counts {
  final int? tripConfirmCount;
  final int? tripStartCount;
  final int? tripCompleteCount;
  final int? tripCancelCount;
  final int? returnTripConfirmCount;
  final int? returnTripStartCount;
  final int? returnTripCompleteCount;
  final int? returnTripCancelCount;
  final int? divisionTripConfirmCount;
  final int? divisionTripCompleteCount;
  final int? divisionTripCancelCount;

  Counts({
    this.tripConfirmCount,
    this.tripStartCount,
    this.tripCompleteCount,
    this.tripCancelCount,
    this.returnTripConfirmCount,
    this.returnTripStartCount,
    this.returnTripCompleteCount,
    this.returnTripCancelCount,
    this.divisionTripConfirmCount,
    this.divisionTripCompleteCount,
    this.divisionTripCancelCount,
  });

  Counts.fromJson(Map<String, dynamic> json)
      : tripConfirmCount = json['trip_confirm_count'] as int?,
        tripStartCount = json['trip_start_count'] as int?,
        tripCompleteCount = json['trip_complete_count'] as int?,
        tripCancelCount = json['trip_cancel_count'] as int?,
        returnTripConfirmCount = json['return_trip_confirm_count'] as int?,
        returnTripStartCount = json['return_trip_start_count'] as int?,
        returnTripCompleteCount = json['return_trip_complete_count'] as int?,
        returnTripCancelCount = json['return_trip_cancel_count'] as int?,
        divisionTripConfirmCount = json['division_trip_confirm_count'] as int?,
        divisionTripCompleteCount = json['division_trip_complete_count'] as int?,
        divisionTripCancelCount = json['division_trip_cancel_count'] as int?;

  Map<String, dynamic> toJson() => {
    'trip_confirm_count' : tripConfirmCount,
    'trip_start_count' : tripStartCount,
    'trip_complete_count' : tripCompleteCount,
    'trip_cancel_count' : tripCancelCount,
    'return_trip_confirm_count' : returnTripConfirmCount,
    'return_trip_start_count' : returnTripStartCount,
    'return_trip_complete_count' : returnTripCompleteCount,
    'return_trip_cancel_count' : returnTripCancelCount,
    'division_trip_confirm_count' : divisionTripConfirmCount,
    'division_trip_complete_count' : divisionTripCompleteCount,
    'division_trip_cancel_count' : divisionTripCancelCount
  };
}

class SortedTrips {
  final int? id;
  final int? tripId;
  final int? bidId;
  final int? vehicleCategory;
  final int? vehicleId;
  final String? pickupLocation;
  final String? dropoffLocation;
  final int? partnerId;
  final int? customerId;
  final String? timedate;
  final String? amount;
  final int? otp;
  final String? trackingId;
  final int? status;
  final dynamic cancelType;
  final dynamic cancelledStatus;
  final dynamic cancelledBy;
  final dynamic cancelreasonId;
  final dynamic cancelCreatedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? source;
  final ReturnRelationships? returnRelationships;
  final DivisionRelationships? divisionRelationships;
  final RentalRelationships? rentalRelationships;
  final Getpartner? getpartner;

  SortedTrips({
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
    this.source,
    this.returnRelationships,
    this.divisionRelationships,
    this.rentalRelationships,
    this.getpartner,
  });

  SortedTrips.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        tripId = json['trip_id'] as int?,
        bidId = json['bid_id'] as int?,
        vehicleCategory = json['vehicle_category'] as int?,
        vehicleId = json['vehicle_id'] as int?,
        pickupLocation = json['pickup_location'] as String?,
        dropoffLocation = json['dropoff_location'] as String?,
        partnerId = json['partner_id'] as int?,
        customerId = json['customer_id'] as int?,
        timedate = json['timedate'] as String?,
        amount = json['amount'].toString(),
        otp = json['otp'] as int?,
        trackingId = json['tracking_id'] as String?,
        status = json['status'] as int?,
        cancelType = json['cancel_type'],
        cancelledStatus = json['cancelled_status'],
        cancelledBy = json['cancelled_by'],
        cancelreasonId = json['cancelreason_id'],
        cancelCreatedAt = json['cancel_created_at'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        source = json['source'] as String?,
        divisionRelationships = json['division_relationships'] != null && json['division_relationships'] is Map<String, dynamic>
            ? DivisionRelationships.fromJson(json['division_relationships'] as Map<String, dynamic>)
            : null,
        rentalRelationships = json['rental_relationships'] != null && json['rental_relationships'] is Map<String, dynamic>
            ? RentalRelationships.fromJson(json['rental_relationships'] as Map<String, dynamic>)
            : null,
        returnRelationships = json['return_relationships'] != null && json['return_relationships'] is Map<String, dynamic>
            ? ReturnRelationships.fromJson(json['return_relationships'] as Map<String, dynamic>)
            : null,
        getpartner = (json['getpartner'] as Map<String,dynamic>?) != null ? Getpartner.fromJson(json['getpartner'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'trip_id' : tripId,
    'bid_id' : bidId,
    'vehicle_category' : vehicleCategory,
    'vehicle_id' : vehicleId,
    'pickup_location' : pickupLocation,
    'dropoff_location' : dropoffLocation,
    'partner_id' : partnerId,
    'customer_id' : customerId,
    'timedate' : timedate,
    'amount' : amount,
    'otp' : otp,
    'tracking_id' : trackingId,
    'status' : status,
    'cancel_type' : cancelType,
    'cancelled_status' : cancelledStatus,
    'cancelled_by' : cancelledBy,
    'cancelreason_id' : cancelreasonId,
    'cancel_created_at' : cancelCreatedAt,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'source' : source,
    'return_relationships' : returnRelationships?.toJson(),
    'division_relationships' : divisionRelationships,
    'rental_relationships' : rentalRelationships,
    'getpartner' : getpartner?.toJson()
  };
}

class ReturnRelationships {
  final ReturnPartner? returnPartner;
  final ReturnTrip? returnTrip;
  final Driver? driver;
  final RetrunCategory? retrunCategory;
  final ReturnVehicle? returnVehicle;

  ReturnRelationships({
    this.returnPartner,
    this.returnTrip,
    this.driver,
    this.retrunCategory,
    this.returnVehicle,
  });

  ReturnRelationships.fromJson(Map<String, dynamic> json)
      : returnPartner = (json['return_partner'] as Map<String,dynamic>?) != null ? ReturnPartner.fromJson(json['return_partner'] as Map<String,dynamic>) : null,
        returnTrip = (json['return_trip'] as Map<String,dynamic>?) != null ? ReturnTrip.fromJson(json['return_trip'] as Map<String,dynamic>) : null,
        driver = (json['driver'] as Map<String,dynamic>?) != null ? Driver.fromJson(json['driver'] as Map<String,dynamic>) : null,
        retrunCategory = (json['retrun_category'] as Map<String,dynamic>?) != null ? RetrunCategory.fromJson(json['retrun_category'] as Map<String,dynamic>) : null,
        returnVehicle = (json['return_vehicle'] as Map<String,dynamic>?) != null ? ReturnVehicle.fromJson(json['return_vehicle'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'return_partner' : returnPartner?.toJson(),
    'return_trip' : returnTrip?.toJson(),
    'driver' : driver?.toJson(),
    'retrun_category' : retrunCategory?.toJson(),
    'return_vehicle' : returnVehicle?.toJson()
  };
}

class ReturnPartner {
  final int? id;
  final String? name;
  final String? phone;
  final dynamic email;
  final String? image;
  final String? type;
  final int? categoryId;
  final dynamic vehicleCategories;
  final dynamic vehicleId;
  final String? docType;
  final dynamic docNumber;
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

  ReturnPartner({
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

  ReturnPartner.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        phone = json['phone'] as String?,
        email = json['email'],
        image = json['image'] as String?,
        type = json['type'] as String?,
        categoryId = json['category_id'] as int?,
        vehicleCategories = json['vehicle_categories'],
        vehicleId = json['vehicle_id'],
        docType = json['doc_type'] as String?,
        docNumber = json['doc_number'],
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

class ReturnTrip {
  final int? id;
  final int? pickupDivision;
  final int? dropoffDivision;
  final String? location;
  final String? destination;
  final String? amount;
  final String? timedate;
  final int? partnerId;
  final int? vehicleCategory;
  final int? vehicleId;
  final int? biding;
  final String? trackingId;
  final int? assignedVehicleId;
  final int? assignedDriverId;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final GetDriver? getDriver;

  ReturnTrip({
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
    this.updatedAt,
    this.getDriver,
  });

  ReturnTrip.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        pickupDivision = json['pickup_division'] as int?,
        dropoffDivision = json['dropoff_division'] as int?,
        location = json['location'] as String?,
        destination = json['destination'] as String?,
        amount = json['amount'] as String?,
        timedate = json['timedate'] as String?,
        partnerId = json['partner_id'] as int?,
        vehicleCategory = json['vehicle_category'] as int?,
        vehicleId = json['vehicle_id'] as int?,
        biding = json['biding'] as int?,
        trackingId = json['tracking_id'] as String?,
        assignedVehicleId = json['assigned_vehicle_id'] as int?,
        assignedDriverId = json['assigned_driver_id'] as int?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        getDriver = (json['get_driver'] as Map<String,dynamic>?) != null ? GetDriver.fromJson(json['get_driver'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'pickup_division' : pickupDivision,
    'dropoff_division' : dropoffDivision,
    'location' : location,
    'destination' : destination,
    'amount' : amount,
    'timedate' : timedate,
    'partner_id' : partnerId,
    'vehicle_category' : vehicleCategory,
    'vehicle_id' : vehicleId,
    'biding' : biding,
    'tracking_id' : trackingId,
    'assigned_vehicle_id' : assignedVehicleId,
    'assigned_driver_id' : assignedDriverId,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'get_driver' : getDriver?.toJson()
  };
}

class GetDriver {
  final int? id;
  final int? partnerId;
  final String? name;
  final String? phone;
  final String? contactNo;
  final dynamic email;
  final String? gender;
  final String? address;
  final dynamic drivingNo;
  final String? drivingImage;
  final String? nidFront;
  final String? nidBack;
  final String? image;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  GetDriver({
    this.id,
    this.partnerId,
    this.name,
    this.phone,
    this.contactNo,
    this.email,
    this.gender,
    this.address,
    this.drivingNo,
    this.drivingImage,
    this.nidFront,
    this.nidBack,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  GetDriver.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        partnerId = json['partner_id'] as int?,
        name = json['name'] as String?,
        phone = json['phone'] as String?,
        contactNo = json['contact_no'] as String?,
        email = json['email'],
        gender = json['gender'] as String?,
        address = json['address'] as String?,
        drivingNo = json['driving_no'],
        drivingImage = json['driving_image'] as String?,
        nidFront = json['nid_front'] as String?,
        nidBack = json['nid_back'] as String?,
        image = json['image'] as String?,
        status = json['status'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'partner_id' : partnerId,
    'name' : name,
    'phone' : phone,
    'contact_no' : contactNo,
    'email' : email,
    'gender' : gender,
    'address' : address,
    'driving_no' : drivingNo,
    'driving_image' : drivingImage,
    'nid_front' : nidFront,
    'nid_back' : nidBack,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Driver {
  final int? id;
  final int? partnerId;
  final String? name;
  final String? phone;
  final String? contactNo;
  final dynamic email;
  final String? gender;
  final String? address;
  final dynamic drivingNo;
  final String? drivingImage;
  final String? nidFront;
  final String? nidBack;
  final String? image;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Driver({
    this.id,
    this.partnerId,
    this.name,
    this.phone,
    this.contactNo,
    this.email,
    this.gender,
    this.address,
    this.drivingNo,
    this.drivingImage,
    this.nidFront,
    this.nidBack,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Driver.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        partnerId = json['partner_id'] as int?,
        name = json['name'] as String?,
        phone = json['phone'] as String?,
        contactNo = json['contact_no'] as String?,
        email = json['email'],
        gender = json['gender'] as String?,
        address = json['address'] as String?,
        drivingNo = json['driving_no'],
        drivingImage = json['driving_image'] as String?,
        nidFront = json['nid_front'] as String?,
        nidBack = json['nid_back'] as String?,
        image = json['image'] as String?,
        status = json['status'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'partner_id' : partnerId,
    'name' : name,
    'phone' : phone,
    'contact_no' : contactNo,
    'email' : email,
    'gender' : gender,
    'address' : address,
    'driving_no' : drivingNo,
    'driving_image' : drivingImage,
    'nid_front' : nidFront,
    'nid_back' : nidBack,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class RetrunCategory {
  final int? id;
  final String? name;
  final String? nameBn;
  final String? slug;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  RetrunCategory({
    this.id,
    this.name,
    this.nameBn,
    this.slug,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  RetrunCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        nameBn = json['name_bn'] as String?,
        slug = json['slug'] as String?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'name_bn' : nameBn,
    'slug' : slug,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class ReturnVehicle {
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

  ReturnVehicle({
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

  ReturnVehicle.fromJson(Map<String, dynamic> json)
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
  final dynamic vehicleId;
  final String? docType;
  final dynamic docNumber;
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
        vehicleId = json['vehicle_id'],
        docType = json['doc_type'] as String?,
        docNumber = json['doc_number'],
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

class DivisionRelationships {
  final DivisionPartner? divisionPartner;
  final DivisionTrip? divisionTrip;
  final DivisionCategory? divisionCategory;
  final DivisionVehicle? divisionVehicle;

  DivisionRelationships({
    this.divisionPartner,
    this.divisionTrip,
    this.divisionCategory,
    this.divisionVehicle,
  });

  DivisionRelationships.fromJson(Map<String, dynamic> json)
      : divisionPartner = (json['division_partner'] as Map<String,dynamic>?) != null ? DivisionPartner.fromJson(json['division_partner'] as Map<String,dynamic>) : null,
        divisionTrip = (json['division_trip'] as Map<String,dynamic>?) != null ? DivisionTrip.fromJson(json['division_trip'] as Map<String,dynamic>) : null,
        divisionCategory = (json['division_category'] as Map<String,dynamic>?) != null ? DivisionCategory.fromJson(json['division_category'] as Map<String,dynamic>) : null,
        divisionVehicle = (json['division_vehicle'] as Map<String,dynamic>?) != null ? DivisionVehicle.fromJson(json['division_vehicle'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'division_partner' : divisionPartner?.toJson(),
    'division_trip' : divisionTrip?.toJson(),
    'division_category' : divisionCategory?.toJson(),
    'division_vehicle' : divisionVehicle?.toJson()
  };
}

class DivisionPartner {
  final int? id;
  final String? name;
  final String? phone;
  final dynamic email;
  final String? image;
  final String? type;
  final int? categoryId;
  final dynamic vehicleCategories;
  final dynamic vehicleId;
  final String? docType;
  final dynamic docNumber;
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

  DivisionPartner({
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

  DivisionPartner.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        phone = json['phone'] as String?,
        email = json['email'],
        image = json['image'] as String?,
        type = json['type'] as String?,
        categoryId = json['category_id'] as int?,
        vehicleCategories = json['vehicle_categories'],
        vehicleId = json['vehicle_id'],
        docType = json['doc_type'] as String?,
        docNumber = json['doc_number'],
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

class DivisionTrip {
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

  DivisionTrip({
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
  });

  DivisionTrip.fromJson(Map<String, dynamic> json)
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
        expiredAt = json['expired_at'] as String?;

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
    'expired_at' : expiredAt
  };
}

class DivisionCategory {
  final int? id;
  final String? name;
  final String? nameBn;
  final String? slug;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  DivisionCategory({
    this.id,
    this.name,
    this.nameBn,
    this.slug,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  DivisionCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        nameBn = json['name_bn'] as String?,
        slug = json['slug'] as String?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'name_bn' : nameBn,
    'slug' : slug,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class DivisionVehicle {
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

  DivisionVehicle({
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

  DivisionVehicle.fromJson(Map<String, dynamic> json)
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

class RentalRelationships {
  final Partner? partner;
  final Vehicle? vehicle;
  final Category? category;
  final Trip? trip;
  final Driver? driver;

  RentalRelationships({
    this.partner,
    this.vehicle,
    this.category,
    this.trip,
    this.driver,
  });

  RentalRelationships.fromJson(Map<String, dynamic> json)
      : partner = (json['partner'] as Map<String,dynamic>?) != null ? Partner.fromJson(json['partner'] as Map<String,dynamic>) : null,
        vehicle = (json['vehicle'] as Map<String,dynamic>?) != null ? Vehicle.fromJson(json['vehicle'] as Map<String,dynamic>) : null,
        category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null,
        trip = (json['trip'] as Map<String,dynamic>?) != null ? Trip.fromJson(json['trip'] as Map<String,dynamic>) : null,
        driver = (json['driver'] as Map<String,dynamic>?) != null ? Driver.fromJson(json['driver'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'partner' : partner?.toJson(),
    'vehicle' : vehicle?.toJson(),
    'category' : category?.toJson(),
    'trip' : trip?.toJson(),
    'driver' : driver?.toJson()
  };
}

class Partner {
  final int? id;
  final String? name;
  final String? phone;
  final dynamic email;
  final String? image;
  final String? type;
  final int? categoryId;
  final dynamic vehicleCategories;
  final dynamic vehicleId;
  final String? docType;
  final dynamic docNumber;
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

  Partner({
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

  Partner.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        phone = json['phone'] as String?,
        email = json['email'],
        image = json['image'] as String?,
        type = json['type'] as String?,
        categoryId = json['category_id'] as int?,
        vehicleCategories = json['vehicle_categories'],
        vehicleId = json['vehicle_id'],
        docType = json['doc_type'] as String?,
        docNumber = json['doc_number'],
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

class Vehicle {
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

  Vehicle({
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

  Vehicle.fromJson(Map<String, dynamic> json)
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

class Category {
  final int? id;
  final String? name;
  final String? nameBn;
  final String? slug;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  Category({
    this.id,
    this.name,
    this.nameBn,
    this.slug,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        nameBn = json['name_bn'] as String?,
        slug = json['slug'] as String?,
        image = json['image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'name_bn' : nameBn,
    'slug' : slug,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Trip {
  final int? id;
  final int? customerId;
  final int? categoryId;
  final int? vehicleId;
  final String? pickupLocation;
  final dynamic viaLocation;
  final String? dropoffLocation;
  final dynamic addressId;
  final dynamic isHourly;
  final dynamic hours;
  final String? map;
  final String? dropoffMap;
  final dynamic districtId;
  final dynamic portId;
  final String? datetime;
  final int? roundTrip;
  final dynamic promoKey;
  final String? roundDatetime;
  final dynamic note;
  final String? trackingId;
  final int? isAirport;
  final int? status;
  final int? biding;
  final String? bidingExpiredAt;
  final int? isCancel;
  final dynamic cancelreasonId;
  final String? createdAt;
  final String? updatedAt;

  Trip({
    this.id,
    this.customerId,
    this.categoryId,
    this.vehicleId,
    this.pickupLocation,
    this.viaLocation,
    this.dropoffLocation,
    this.addressId,
    this.isHourly,
    this.hours,
    this.map,
    this.dropoffMap,
    this.districtId,
    this.portId,
    this.datetime,
    this.roundTrip,
    this.promoKey,
    this.roundDatetime,
    this.note,
    this.trackingId,
    this.isAirport,
    this.status,
    this.biding,
    this.bidingExpiredAt,
    this.isCancel,
    this.cancelreasonId,
    this.createdAt,
    this.updatedAt,
  });

  Trip.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        customerId = json['customer_id'] as int?,
        categoryId = json['category_id'] as int?,
        vehicleId = json['vehicle_id'] as int?,
        pickupLocation = json['pickup_location'] as String?,
        viaLocation = json['via_location'],
        dropoffLocation = json['dropoff_location'] as String?,
        addressId = json['address_id'],
        isHourly = json['is_hourly'],
        hours = json['hours'],
        map = json['map'] as String?,
        dropoffMap = json['dropoff_map'] as String?,
        districtId = json['district_id'],
        portId = json['port_id'],
        datetime = json['datetime'] as String?,
        roundTrip = json['round_trip'] as int?,
        promoKey = json['promo_key'],
        roundDatetime = json['round_datetime'] as String?,
        note = json['note'],
        trackingId = json['tracking_id'] as String?,
        isAirport = json['is_airport'] as int?,
        status = json['status'] as int?,
        biding = json['biding'] as int?,
        bidingExpiredAt = json['biding_expired_at'] as String?,
        isCancel = json['is_cancel'] as int?,
        cancelreasonId = json['cancelreason_id'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'customer_id' : customerId,
    'category_id' : categoryId,
    'vehicle_id' : vehicleId,
    'pickup_location' : pickupLocation,
    'via_location' : viaLocation,
    'dropoff_location' : dropoffLocation,
    'address_id' : addressId,
    'is_hourly' : isHourly,
    'hours' : hours,
    'map' : map,
    'dropoff_map' : dropoffMap,
    'district_id' : districtId,
    'port_id' : portId,
    'datetime' : datetime,
    'round_trip' : roundTrip,
    'promo_key' : promoKey,
    'round_datetime' : roundDatetime,
    'note' : note,
    'tracking_id' : trackingId,
    'is_airport' : isAirport,
    'status' : status,
    'biding' : biding,
    'biding_expired_at' : bidingExpiredAt,
    'is_cancel' : isCancel,
    'cancelreason_id' : cancelreasonId,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

