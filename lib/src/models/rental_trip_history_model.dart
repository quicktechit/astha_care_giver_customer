class RentalHistory {
  RentalHistory({
    this.status,
    this.data,
  });

  final String? status;
  final List<Rental>? data;

  factory RentalHistory.fromJson(Map<String, dynamic> json) {
    return RentalHistory(
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<Rental>.from(json["data"]!.map((x) => Rental.fromJson(x))),
    );
  }
}

class Rental {
  Rental({
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
    this.status,
    this.biding,
    this.createdAt,
    this.updatedAt,
    this.amount,
    this.vehicle,
  });

  final int? id;
  final int? customerId;
  final int? vehicleId;
  final String? pickupLocation;
  final String? viaLocation;
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
  final String? note;
  final int? status;
  final int? biding;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? amount;
  final Vehicle? vehicle;

  factory Rental.fromJson(Map<String, dynamic> json) {
    return Rental(
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
      status: json["status"],
      biding: json["biding"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      amount: json["amount"],
      vehicle:
          json["vehicle"] == null ? null : Vehicle.fromJson(json["vehicle"]),
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

  factory Vehicle.fromJson(Map<String, dynamic> json) {
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
