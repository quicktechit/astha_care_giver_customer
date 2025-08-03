class LiveBiddingModel {
  LiveBiddingModel({
    this.status,
    this.data,
  });

  final String? status;
  final List<LiveBidData>? data;

  factory LiveBiddingModel.fromJson(Map<String, dynamic> json) {
    return LiveBiddingModel(
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<LiveBidData>.from(
              json["data"]!.map((x) => LiveBidData.fromJson(x))),
    );
  }
}

class LiveBidData {
  LiveBidData({
    this.id,
    this.tripId,
    this.customerId,
    this.partnerId,
    this.vehicleId,
    this.amount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.getvehicle,
    this.getpartner,
    this.getBrand,
  });

  final int? id;
  final int? tripId;
  final int? customerId;
  final int? partnerId;
  final int? vehicleId;
  final String? amount;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Getvehicle? getvehicle;
  final Getpartner? getpartner;
  final GetBrand? getBrand;

  factory LiveBidData.fromJson(Map<String, dynamic> json) {
    return LiveBidData(
      id: json["id"],
      tripId: json["trip_id"],
      customerId: json["customer_id"],
      partnerId: json["partner_id"],
      vehicleId: json["vehicle_id"],
      amount: json["amount"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      getvehicle: json["get_car"] == null
          ? null
          : Getvehicle.fromJson(json["get_car"]),
      getpartner: json["getpartner"] == null
          ? null
          : Getpartner.fromJson(json["getpartner"]),
      getBrand: json["get_brand"] == null
          ? null
          : GetBrand.fromJson(json["get_brand"]),
    );
  }
}

class GetBrand {
  GetBrand({
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

  final int? id;
  final int? vehicleCategory;
  final String? name;
  final String? nameBn;
  final String? slug;
  final String? capacity;
  final String? image;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory GetBrand.fromJson(Map<String, dynamic> json) {
    return GetBrand(
      id: json["id"],
      vehicleCategory: json["vehicle_category"],
      name: json["name"],
      nameBn: json["name_bn"],
      slug: json["slug"],
      capacity: json["capacity"],
      image: json["image"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class Getpartner {
  Getpartner({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.image,
    this.docType,
    this.docNumber,
    this.docFront,
    this.docBack,
    this.division,
    this.address,
    this.gender,
    this.referCode,
    this.myreferKey,
    this.verify,
    this.forgotCode,
    this.credit,
    this.debit,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final dynamic name;
  final String? phone;
  final dynamic email;
  final dynamic image;
  final dynamic docType;
  final dynamic docNumber;
  final dynamic docFront;
  final dynamic docBack;
  final dynamic division;
  final dynamic address;
  final dynamic gender;
  final dynamic referCode;
  final String? myreferKey;
  final String? verify;
  final dynamic forgotCode;
  final int? credit;
  final int? debit;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Getpartner.fromJson(Map<String, dynamic> json) {
    return Getpartner(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      image: json["image"],
      docType: json["doc_type"],
      docNumber: json["doc_number"],
      docFront: json["doc_front"],
      docBack: json["doc_back"],
      division: json["division"],
      address: json["address"],
      gender: json["gender"],
      referCode: json["refer_code"],
      myreferKey: json["myrefer_key"],
      verify: json["verify"],
      forgotCode: json["forgot_code"],
      credit: json["credit"],
      debit: json["debit"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class Getvehicle {
  Getvehicle({
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

  final int? id;
  final int? partnerId;
  final int? vehicleCategory;
  final int? brand;
  final String? metro;
  final int? metroType;
  final String? metroNo;
  final String? model;
  final String? modelYear;
  final String? vehicleColor;
  final String? aircondition;
  final String? vehicleFrontPic;
  final String? vehicleBackPic;
  final String? vehiclePlateNo;
  final String? vehicleRegPic;
  final String? vehicleRootPic;
  final String? vehicleFitnessPic;
  final String? vehicleTaxPic;
  final String? vehicleInsurancePic;
  final String? vehicleDrivingFront;
  final String? vehicleDrivingBack;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Getvehicle.fromJson(Map<String, dynamic> json) {
    return Getvehicle(
      id: json["id"],
      partnerId: json["partner_id"],
      vehicleCategory: json["vehicle_category"],
      brand: json["brand"],
      metro: json["metro"],
      metroType: json["metro_type"],
      metroNo: json["metro_no"],
      model: json["model"],
      modelYear: json["model_year"],
      vehicleColor: json["vehicle_color"],
      aircondition: json["aircondition"],
      vehicleFrontPic: json["vehicle_front_pic"],
      vehicleBackPic: json["vehicle_back_pic"],
      vehiclePlateNo: json["vehicle_plate_no"],
      vehicleRegPic: json["vehicle_reg_pic"],
      vehicleRootPic: json["vehicle_root_pic"],
      vehicleFitnessPic: json["vehicle_fitness_pic"],
      vehicleTaxPic: json["vehicle_tax_pic"],
      vehicleInsurancePic: json["vehicle_insurance_pic"],
      vehicleDrivingFront: json["vehicle_driving_front"],
      vehicleDrivingBack: json["vehicle_driving_back"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
