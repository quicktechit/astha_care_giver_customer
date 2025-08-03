class SingleTripDetailsModel {
  SingleTripDetailsModel({
      this.status,
      this.data,
  });

  final String? status;
  final SingleTripDetails? data;

  factory SingleTripDetailsModel.fromJson(Map<String, dynamic> json){
    return SingleTripDetailsModel(
      status: json["status"],
      data: json["data"] == null ? null : SingleTripDetails.fromJson(json["data"]),
    );
  }

}

class SingleTripDetails {
  SingleTripDetails({
      this.tripHistory,
      this.partner,
      this.driver,
  });

  final TripHistory? tripHistory;
  final Partner? partner;
  final Driver? driver;

  factory SingleTripDetails.fromJson(Map<String, dynamic> json){
    return SingleTripDetails(
      tripHistory: json["trip_history"] == null ? null : TripHistory.fromJson(json["trip_history"]),
      partner: json["partner"] == null ? null : Partner.fromJson(json["partner"]),
      driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
    );
  }

}

class Driver {
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

  final int? id;
  final int? partnerId;
  final String? name;
  final String? phone;
  final String? contactNo;
  final String? email;
  final String? gender;
  final String? address;
  final String? drivingNo;
  final String? drivingImage;
  final String? nidFront;
  final String? nidBack;
  final String? image;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Driver.fromJson(Map<String, dynamic> json){
    return Driver(
      id: json["id"],
      partnerId: json["partner_id"],
      name: json["name"],
      phone: json["phone"],
      contactNo: json["contact_no"],
      email: json["email"],
      gender: json["gender"],
      address: json["address"],
      drivingNo: json["driving_no"],
      drivingImage: json["driving_image"],
      nidFront: json["nid_front"],
      nidBack: json["nid_back"],
      image: json["image"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}

class Partner {
  Partner({
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
  final String? name;
  final String? phone;
  final String? email;
  final String? image;
  final String? docType;
  final String? docNumber;
  final String? docFront;
  final String? docBack;
  final String? division;
  final String? address;
  final String? gender;
  final dynamic referCode;
  final String? myreferKey;
  final String? verify;
  final String? forgotCode;
  final int? credit;
  final int? debit;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Partner.fromJson(Map<String, dynamic> json){
    return Partner(
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

class TripHistory {
  TripHistory({
      this.id,
      this.customerId,
      this.vehicleId,
      this.pickupLocation,
      this.viaLocation,
      this.dropoffLocation,
      this.addressId,
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
      this.status,
      this.biding,
      this.bidingExpiredAt,
      this.createdAt,
      this.updatedAt,
      this.amount,
      this.otp,
      this.partnerId,
      this.assignedDriverId,
      this.vehicle,
  });

  final int? id;
  final int? customerId;
  final int? vehicleId;
  final String? pickupLocation;
  final dynamic viaLocation;
  final String? dropoffLocation;
  final dynamic addressId;
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
  final int? status;
  final int? biding;
  final DateTime? bidingExpiredAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? amount;
  final int? otp;
  final int? partnerId;
  final int? assignedDriverId;
  final Vehicle? vehicle;

  factory TripHistory.fromJson(Map<String, dynamic> json){
    return TripHistory(
      id: json["id"],
      customerId: json["customer_id"],
      vehicleId: json["vehicle_id"],
      pickupLocation: json["pickup_location"],
      viaLocation: json["via_location"],
      dropoffLocation: json["dropoff_location"],
      addressId: json["address_id"],
      map: json["map"],
      dropoffMap: json["dropoff_map"],
      districtId: json["district_id"],
      portId: json["port_id"],
      datetime: json["datetime"],
      roundTrip: json["round_trip"],
      promoKey: json["promo_key"],
      roundDatetime: json["round_datetime"],
      note: json["note"],
      trackingId: json["tracking_id"],
      status: json["status"],
      biding: json["biding"],
      bidingExpiredAt: DateTime.tryParse(json["biding_expired_at"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      amount: json["amount"],
      otp: json["otp"],
      partnerId: json["partner_id"],
      assignedDriverId: json["assigned_driver_id"],
      vehicle: json["vehicle"] == null ? null : Vehicle.fromJson(json["vehicle"]),
    );
  }

}

class Vehicle {
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

  factory Vehicle.fromJson(Map<String, dynamic> json){
    return Vehicle(
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
