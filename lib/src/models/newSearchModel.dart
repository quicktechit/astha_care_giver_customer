class NewSearchModel {
  NewSearchModel({
    this.status,
    this.count,
    this.returnCount,
    this.advanceCount,
    this.partnerTripRequestsCount,
    this.data,
    this.adminPhone,
    this.returnData,
    this.advanceData,
    this.partnerTripRequests,
  });

  NewSearchModel.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    adminPhone= json['admin_phone'];
    returnCount = json['return_count'];
    advanceCount = json['advance_count'];
    partnerTripRequestsCount = json['partnerTripRequests_count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    if (json['returnData'] != null) {
      returnData = [];
      json['returnData'].forEach((v) {
        returnData?.add(ReturnData.fromJson(v));
      });
    }
    if (json['advanceData'] != null) {
      advanceData = [];
      json['advanceData'].forEach((v) {
        advanceData?.add(AdvanceData.fromJson(v));
      });
    }
    if (json['partnerTripRequests'] != null) {
      partnerTripRequests = [];
      json['partnerTripRequests'].forEach((v) {
        partnerTripRequests?.add(PartnerTripRequests.fromJson(v));
      });
    }
  }

  String? status;
  String? adminPhone;
  int? count;
  int? returnCount;
  int? advanceCount;
  int? partnerTripRequestsCount;
  List<Data>? data;
  List<ReturnData>? returnData;
  List<AdvanceData>? advanceData;
  List<PartnerTripRequests>? partnerTripRequests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['count'] = count;
    map['return_count'] = returnCount;
    map['advance_count'] = advanceCount;
    map['partnerTripRequests_count'] = partnerTripRequestsCount;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (returnData != null) {
      map['returnData'] = returnData?.map((v) => v.toJson()).toList();
    }
    if (advanceData != null) {
      map['advanceData'] = advanceData?.map((v) => v.toJson()).toList();
    }
    if (partnerTripRequests != null) {
      map['partnerTripRequests'] =
          partnerTripRequests?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class PartnerTripRequests {
  PartnerTripRequests({
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
    this.getpartner,
    this.assignedVehicleId,
    this.assignedDriverId,
    this.status,
    this.getcategory,
    this.getvehicle,
    this.getCar,
    this.createdAt,
    this.updatedAt,
  });

  PartnerTripRequests.fromJson(dynamic json) {
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
    getpartner = json['getpartner'] != null
        ? Getpartner.fromJson(json['getpartner'])
        : null;
    getcategory = json['getcategory'] != null
        ? Getcategory.fromJson(json['getcategory'])
        : null;
    getvehicle = json['getvehicle'] != null
        ? Getvehicle.fromJson(json['getvehicle'])
        : null;
    getCar = json['get_car'] != null ? GetCar.fromJson(json['get_car']) : null;
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
  Getpartner? getpartner;
  int? biding;
  dynamic trackingId;
  dynamic assignedVehicleId;
  dynamic assignedDriverId;
  Getcategory? getcategory;
  Getvehicle? getvehicle;
  GetCar? getCar;
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
    if (getpartner != null) {
      map['getpartner'] = getpartner?.toJson();
    }
    if (getcategory != null) {
      map['getcategory'] = getcategory?.toJson();
    }
    if (getvehicle != null) {
      map['getvehicle'] = getvehicle?.toJson();
    }
    if (getCar != null) {
      map['get_car'] = getCar?.toJson();
    }
    return map;
  }
}

class AdvanceData {
  AdvanceData({
    this.id,
    this.partnerId,
    this.type,
    this.divisionId,
    this.pickupTime,
    this.expireTime,
    this.pickupLocation,
    this.dropoffLocation,
    this.vehicleCategory,
    this.vehicleId,
    this.assignedVehicleId,
    this.driverName,
    this.driverPhone,
    this.totalPrice,
    this.totalCommission,
    this.status,
    this.adminStatus,
    this.createdAt,
    this.updatedAt,
    this.getpartner,
    this.getcategory,
    this.getvehicle,
    this.getCar,
  });

  AdvanceData.fromJson(dynamic json) {
    id = json['id'];
    partnerId = json['partner_id'];
    type = json['type'];
    divisionId = json['division_id'];
    pickupTime = json['pickup_time'];
    expireTime = json['expire_time'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    assignedVehicleId = json['assigned_vehicle_id'];
    driverName = json['driver_name'];
    driverPhone = json['driver_phone'];
    totalPrice = json['total_price'];
    totalCommission = json['total_commission'];
    status = json['status'];
    adminStatus = json['admin_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getpartner = json['getpartner'] != null
        ? Getpartner.fromJson(json['getpartner'])
        : null;
    getcategory = json['getcategory'] != null
        ? Getcategory.fromJson(json['getcategory'])
        : null;
    getvehicle = json['getvehicle'] != null
        ? Getvehicle.fromJson(json['getvehicle'])
        : null;
    getCar = json['get_car'] != null ? GetCar.fromJson(json['get_car']) : null;
  }

  int? id;
  int? partnerId;
  String? type;
  int? divisionId;
  String? pickupTime;
  dynamic expireTime;
  String? pickupLocation;
  String? dropoffLocation;
  int? vehicleCategory;
  int? vehicleId;
  int? assignedVehicleId;
  dynamic driverName;
  String? driverPhone;
  int? totalPrice;
  int? totalCommission;
  int? status;
  int? adminStatus;
  String? createdAt;
  String? updatedAt;
  Getpartner? getpartner;
  Getcategory? getcategory;
  Getvehicle? getvehicle;
  GetCar? getCar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['partner_id'] = partnerId;
    map['type'] = type;
    map['division_id'] = divisionId;
    map['pickup_time'] = pickupTime;
    map['expire_time'] = expireTime;
    map['pickup_location'] = pickupLocation;
    map['dropoff_location'] = dropoffLocation;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['assigned_vehicle_id'] = assignedVehicleId;
    map['driver_name'] = driverName;
    map['driver_phone'] = driverPhone;
    map['total_price'] = totalPrice;
    map['total_commission'] = totalCommission;
    map['status'] = status;
    map['admin_status'] = adminStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (getpartner != null) {
      map['getpartner'] = getpartner?.toJson();
    }
    if (getcategory != null) {
      map['getcategory'] = getcategory?.toJson();
    }
    if (getvehicle != null) {
      map['getvehicle'] = getvehicle?.toJson();
    }
    if (getCar != null) {
      map['get_car'] = getCar?.toJson();
    }
    return map;
  }
}

class GetCar {
  GetCar({
    this.id,
    this.partnerId,
    this.vehicleCategory,
    this.brand,
    this.metro,
    this.metroType,
    this.metroNo,
    this.model,
    this.modelYear,
    this.vehicleColor,
    this.aircondition,
    this.brandName,
    this.fuelType,
    this.vehicleFrontPic,
    this.vehicleBackPic,
    this.vehiclePlateNo,
    this.vehicleRegPic,
    this.vehicleRootPic,
    this.vehicleFitnessPic,
    this.vehicleTaxPic,
    this.vehicleInsurancePic,
    this.vehicleDrivingFront,
    this.vehicleDrivingBack,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  GetCar.fromJson(dynamic json) {
    id = json['id'];
    partnerId = json['partner_id'];
    vehicleCategory = json['vehicle_category'];
    brand = json['brand'];
    metro = json['metro'];
    metroType = json['metro_type'];
    metroNo = json['metro_no'];
    model = json['model'];
    modelYear = json['model_year'];
    vehicleColor = json['vehicle_color'];
    aircondition = json['aircondition'];
    brandName = json['brand_name'];
    fuelType = json['fuel_type'];
    vehicleFrontPic = json['vehicle_front_pic'];
    vehicleBackPic = json['vehicle_back_pic'];
    vehiclePlateNo = json['vehicle_plate_no'];
    vehicleRegPic = json['vehicle_reg_pic'];
    vehicleRootPic = json['vehicle_root_pic'];
    vehicleFitnessPic = json['vehicle_fitness_pic'];
    vehicleTaxPic = json['vehicle_tax_pic'];
    vehicleInsurancePic = json['vehicle_insurance_pic'];
    vehicleDrivingFront = json['vehicle_driving_front'];
    vehicleDrivingBack = json['vehicle_driving_back'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  int? partnerId;
  int? vehicleCategory;
  int? brand;
  String? metro;
  int? metroType;
  String? metroNo;
  String? model;
  String? modelYear;
  String? vehicleColor;
  String? aircondition;
  String? brandName;
  String? fuelType;
  String? vehicleFrontPic;
  String? vehicleBackPic;
  String? vehiclePlateNo;
  String? vehicleRegPic;
  String? vehicleRootPic;
  String? vehicleFitnessPic;
  String? vehicleTaxPic;
  String? vehicleInsurancePic;
  String? vehicleDrivingFront;
  String? vehicleDrivingBack;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['partner_id'] = partnerId;
    map['vehicle_category'] = vehicleCategory;
    map['brand'] = brand;
    map['metro'] = metro;
    map['metro_type'] = metroType;
    map['metro_no'] = metroNo;
    map['model'] = model;
    map['model_year'] = modelYear;
    map['vehicle_color'] = vehicleColor;
    map['aircondition'] = aircondition;
    map['brand_name'] = brandName;
    map['fuel_type'] = fuelType;
    map['vehicle_front_pic'] = vehicleFrontPic;
    map['vehicle_back_pic'] = vehicleBackPic;
    map['vehicle_plate_no'] = vehiclePlateNo;
    map['vehicle_reg_pic'] = vehicleRegPic;
    map['vehicle_root_pic'] = vehicleRootPic;
    map['vehicle_fitness_pic'] = vehicleFitnessPic;
    map['vehicle_tax_pic'] = vehicleTaxPic;
    map['vehicle_insurance_pic'] = vehicleInsurancePic;
    map['vehicle_driving_front'] = vehicleDrivingFront;
    map['vehicle_driving_back'] = vehicleDrivingBack;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
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
    this.updatedAt,
  });

  Getvehicle.fromJson(dynamic json) {
    id = json['id'];
    vehicleCategory = json['vehicle_category'];
    name = json['name'];
    nameBn = json['name_bn'];
    slug = json['slug'];
    capacity = json['capacity'];
    image = json['image'];
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
    this.updatedAt,
  });

  Getcategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    slug = json['slug'];
    image = json['image'];
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

class Getpartner {
  Getpartner({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.image,
    this.type,
    this.categoryId,
    this.vehicleId,
    this.docType,
    this.docNumber,
    this.docFront,
    this.docBack,
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
    this.status,
    this.createdAt,
    this.updatedAt,
    this.package,
  });

  Getpartner.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    type = json['type'];
    categoryId = json['category_id'];
    vehicleId = json['vehicle_id'];
    docType = json['doc_type'];
    docNumber = json['doc_number'];
    docFront = json['doc_front'];
    docBack = json['doc_back'];
    licenceFront = json['licence_front'];
    licenceBack = json['licence_back'];
    nidFront = json['nid_front'];
    nidBack = json['nid_back'];
    tradeLicence = json['trade_licence'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    upazilaId = json['upazila_id'];
    thanaId = json['thana_id'];
    unionId = json['union_id'];
    address = json['address'];
    gender = json['gender'];
    referCode = json['refer_code'];
    myreferKey = json['myrefer_key'];
    verify = json['verify'];
    forgotCode = json['forgot_code'];
    credit = json['credit'];
    debit = json['debit'];
    deviceToken = json['device_token'];
    packageId = json['package_id'];
    packageStatus = json['package_status'];
    enableDate = json['enable_date'];
    expireDate = json['expire_date'];
    currentMap = json['current_map'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    package =
        json['package'] != null ? Package.fromJson(json['package']) : null;
  }

  int? id;
  String? name;
  String? phone;
  String? email;
  String? image;
  String? type;
  int? categoryId;
  dynamic vehicleId;
  String? docType;
  String? docNumber;
  String? docFront;
  String? docBack;
  dynamic licenceFront;
  dynamic licenceBack;
  String? nidFront;
  String? nidBack;
  dynamic tradeLicence;
  int? divisionId;
  dynamic districtId;
  dynamic upazilaId;
  dynamic thanaId;
  dynamic unionId;
  String? address;
  String? gender;
  dynamic referCode;
  String? myreferKey;
  String? verify;
  String? forgotCode;
  int? credit;
  int? debit;
  dynamic deviceToken;
  int? packageId;
  int? packageStatus;
  String? enableDate;
  String? expireDate;
  dynamic currentMap;
  int? status;
  String? createdAt;
  String? updatedAt;
  Package? package;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['image'] = image;
    map['type'] = type;
    map['category_id'] = categoryId;
    map['vehicle_id'] = vehicleId;
    map['doc_type'] = docType;
    map['doc_number'] = docNumber;
    map['doc_front'] = docFront;
    map['doc_back'] = docBack;
    map['licence_front'] = licenceFront;
    map['licence_back'] = licenceBack;
    map['nid_front'] = nidFront;
    map['nid_back'] = nidBack;
    map['trade_licence'] = tradeLicence;
    map['division_id'] = divisionId;
    map['district_id'] = districtId;
    map['upazila_id'] = upazilaId;
    map['thana_id'] = thanaId;
    map['union_id'] = unionId;
    map['address'] = address;
    map['gender'] = gender;
    map['refer_code'] = referCode;
    map['myrefer_key'] = myreferKey;
    map['verify'] = verify;
    map['forgot_code'] = forgotCode;
    map['credit'] = credit;
    map['debit'] = debit;
    map['device_token'] = deviceToken;
    map['package_id'] = packageId;
    map['package_status'] = packageStatus;
    map['enable_date'] = enableDate;
    map['expire_date'] = expireDate;
    map['current_map'] = currentMap;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (package != null) {
      map['package'] = package?.toJson();
    }
    return map;
  }
}

class Package {
  Package({
    this.id,
    this.categoryId,
    this.packageType,
    this.slug,
    this.price,
    this.duration,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Package.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    packageType = json['package_type'];
    slug = json['slug'];
    price = json['price'];
    duration = json['duration'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  int? categoryId;
  String? packageType;
  String? slug;
  int? price;
  int? duration;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['package_type'] = packageType;
    map['slug'] = slug;
    map['price'] = price;
    map['duration'] = duration;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class ReturnData {
  ReturnData({
    this.id,
    this.partnerId,
    this.type,
    this.divisionId,
    this.pickupTime,
    this.expireTime,
    this.pickupLocation,
    this.dropoffLocation,
    this.vehicleCategory,
    this.vehicleId,
    this.assignedVehicleId,
    this.driverName,
    this.driverPhone,
    this.totalPrice,
    this.totalCommission,
    this.status,
    this.adminStatus,
    this.createdAt,
    this.updatedAt,
    this.getpartner,
    this.getcategory,
    this.getvehicle,
    this.getCar,
  });

  ReturnData.fromJson(dynamic json) {
    id = json['id'];
    partnerId = json['partner_id'];
    type = json['type'];
    divisionId = json['division_id'];
    pickupTime = json['pickup_time'];
    expireTime = json['expire_time'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    assignedVehicleId = json['assigned_vehicle_id'];
    driverName = json['driver_name'];
    driverPhone = json['driver_phone'];
    totalPrice = json['total_price'];
    totalCommission = json['total_commission'];
    status = json['status'];
    adminStatus = json['admin_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    // Deserialize related objects properly
    getpartner = json['getpartner'] != null
        ? Getpartner.fromJson(json['getpartner'])
        : null;

    getcategory = json['getcategory'] != null
        ? Getcategory.fromJson(json['getcategory'])
        : null;

    getvehicle = json['getvehicle'] != null
        ? Getvehicle.fromJson(json['getvehicle'])
        : null;

    getCar = json['get_car'] != null
        ? GetCar.fromJson(json['get_car'])
        : null;
  }


  int? id;
  int? partnerId;
  String? type;
  int? divisionId;
  String? pickupTime;
  String? expireTime;
  String? pickupLocation;
  String? dropoffLocation;
  int? vehicleCategory;
  dynamic vehicleId;
  int? assignedVehicleId;
  String? driverName;
  String? driverPhone;
  int? totalPrice;
  int? totalCommission;
  int? status;
  int? adminStatus;
  String? createdAt;
  String? updatedAt;
  Getpartner? getpartner;
  Getcategory? getcategory;
  Getvehicle? getvehicle;
  GetCar? getCar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['partner_id'] = partnerId;
    map['type'] = type;
    map['division_id'] = divisionId;
    map['pickup_time'] = pickupTime;
    map['expire_time'] = expireTime;
    map['pickup_location'] = pickupLocation;
    map['dropoff_location'] = dropoffLocation;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['assigned_vehicle_id'] = assignedVehicleId;
    map['driver_name'] = driverName;
    map['driver_phone'] = driverPhone;
    map['total_price'] = totalPrice;
    map['total_commission'] = totalCommission;
    map['status'] = status;
    map['admin_status'] = adminStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (getpartner != null) {
      map['getpartner'] = getpartner?.toJson();
    }
    map['getcategory'] = getcategory;
    map['getvehicle'] = getvehicle;
    map['get_car'] = getCar;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.partnerId,
    this.type,
    this.divisionId,
    this.pickupTime,
    this.expireTime,
    this.pickupLocation,
    this.dropoffLocation,
    this.vehicleCategory,
    this.vehicleId,
    this.assignedVehicleId,
    this.driverName,
    this.driverPhone,
    this.totalPrice,
    this.totalCommission,
    this.status,
    this.adminStatus,
    this.createdAt,
    this.updatedAt,
    this.getpartner,
    this.getcategory,
    this.getvehicle,
    this.getCar,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    partnerId = json['partner_id'];
    type = json['type'];
    divisionId = json['division_id'];
    pickupTime = json['pickup_time'];
    expireTime = json['expire_time'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    vehicleCategory = json['vehicle_category'];
    vehicleId = json['vehicle_id'];
    assignedVehicleId = json['assigned_vehicle_id'];
    driverName = json['driver_name'];
    driverPhone = json['driver_phone'];
    totalPrice = json['total_price'];
    totalCommission = json['total_commission'];
    status = json['status'];
    adminStatus = json['admin_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getpartner = json['getpartner'] != null
        ? Getpartner.fromJson(json['getpartner'])
        : null;
    getcategory = json['getcategory'] != null
        ? Getcategory.fromJson(json['getcategory'])
        : null;
    getvehicle = json['getvehicle'] != null
        ? Getvehicle.fromJson(json['getvehicle'])
        : null;
    getCar = json['get_car'] != null ? GetCar.fromJson(json['get_car']) : null;
  }

  int? id;
  int? partnerId;
  String? type;
  int? divisionId;
  String? pickupTime;
  dynamic expireTime;
  String? pickupLocation;
  String? dropoffLocation;
  int? vehicleCategory;
  int? vehicleId;
  int? assignedVehicleId;
  dynamic driverName;
  String? driverPhone;
  int? totalPrice;
  int? totalCommission;
  int? status;
  int? adminStatus;
  String? createdAt;
  String? updatedAt;
  Getpartner? getpartner;
  Getcategory? getcategory;
  Getvehicle? getvehicle;
  GetCar? getCar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['partner_id'] = partnerId;
    map['type'] = type;
    map['division_id'] = divisionId;
    map['pickup_time'] = pickupTime;
    map['expire_time'] = expireTime;
    map['pickup_location'] = pickupLocation;
    map['dropoff_location'] = dropoffLocation;
    map['vehicle_category'] = vehicleCategory;
    map['vehicle_id'] = vehicleId;
    map['assigned_vehicle_id'] = assignedVehicleId;
    map['driver_name'] = driverName;
    map['driver_phone'] = driverPhone;
    map['total_price'] = totalPrice;
    map['total_commission'] = totalCommission;
    map['status'] = status;
    map['admin_status'] = adminStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (getpartner != null) {
      map['getpartner'] = getpartner?.toJson();
    }
    if (getcategory != null) {
      map['getcategory'] = getcategory?.toJson();
    }
    if (getvehicle != null) {
      map['getvehicle'] = getvehicle?.toJson();
    }
    if (getCar != null) {
      map['get_car'] = getCar?.toJson();
    }
    return map;
  }
}
