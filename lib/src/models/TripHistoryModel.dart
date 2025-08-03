class TripHistoryModel {
  final String? status;
  final String? message;
  final int? tripConfirmCount;
  final int? tripStartCount;
  final int? tripCompleteCount;
  final int? tripCancelCount;
  final List<TripConfirmHistory>? tripConfirmHistory;
  final List<TripStartHistory>? tripStartHistory;
  final List<TripCompleteHistory>? tripCompleteHistory;
  final List<TripCancelHistory>? tripCancelHistory;

  TripHistoryModel({
    this.status,
    this.message,
    this.tripConfirmCount,
    this.tripStartCount,
    this.tripCompleteCount,
    this.tripCancelCount,
    this.tripConfirmHistory,
    this.tripStartHistory,
    this.tripCompleteHistory,
    this.tripCancelHistory,
  });

  TripHistoryModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        message = json['message'] as String?,
        tripConfirmCount = json['trip_confirm_count'] as int?,
        tripStartCount = json['trip_start_count'] as int?,
        tripCompleteCount = json['trip_complete_count'] as int?,
        tripCancelCount = json['trip_cancel_count'] as int?,
        tripConfirmHistory = (json['trip_confirm_history'] as List?)
            ?.map((dynamic e) =>
                TripConfirmHistory.fromJson(e as Map<String, dynamic>))
            .toList(),
        tripStartHistory = (json['trip_start_history'] as List?)
            ?.map((dynamic e) =>
                TripStartHistory.fromJson(e as Map<String, dynamic>))
            .toList(),
        tripCompleteHistory = (json['trip_complete_history'] as List?)
            ?.map((dynamic e) =>
                TripCompleteHistory.fromJson(e as Map<String, dynamic>))
            .toList(),
        tripCancelHistory = (json['trip_cancel_history'] as List?)
            ?.map((dynamic e) =>
                TripCancelHistory.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'trip_confirm_count': tripConfirmCount,
        'trip_start_count': tripStartCount,
        'trip_complete_count': tripCompleteCount,
        'trip_cancel_count': tripCancelCount,
        'trip_confirm_history':
            tripConfirmHistory?.map((e) => e.toJson()).toList(),
        'trip_start_history': tripStartHistory?.map((e) => e.toJson()).toList(),
        'trip_complete_history':
            tripCompleteHistory?.map((e) => e.toJson()).toList(),
        'trip_cancel_history':
            tripCancelHistory?.map((e) => e.toJson()).toList()
      };
}

class TripConfirmHistory {
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
  final int? amount;
  final Category? category;
  final Vehicle? vehicle;

  TripConfirmHistory({
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
    this.amount,
    this.category,
    this.vehicle,
  });

  TripConfirmHistory.fromJson(Map<String, dynamic> json)
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
        updatedAt = json['updated_at'] as String?,
        amount = json['amount'] as int?,
        category = (json['category'] as Map<String, dynamic>?) != null
            ? Category.fromJson(json['category'] as Map<String, dynamic>)
            : null,
        vehicle = (json['vehicle'] as Map<String, dynamic>?) != null
            ? Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'category_id': categoryId,
        'vehicle_id': vehicleId,
        'pickup_location': pickupLocation,
        'via_location': viaLocation,
        'dropoff_location': dropoffLocation,
        'address_id': addressId,
        'is_hourly': isHourly,
        'hours': hours,
        'map': map,
        'dropoff_map': dropoffMap,
        'district_id': districtId,
        'port_id': portId,
        'datetime': datetime,
        'round_trip': roundTrip,
        'promo_key': promoKey,
        'round_datetime': roundDatetime,
        'note': note,
        'tracking_id': trackingId,
        'is_airport': isAirport,
        'status': status,
        'biding': biding,
        'biding_expired_at': bidingExpiredAt,
        'is_cancel': isCancel,
        'cancelreason_id': cancelreasonId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'amount': amount,
        'category': category?.toJson(),
        'vehicle': vehicle?.toJson()
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
        'id': id,
        'name': name,
        'name_bn': nameBn,
        'slug': slug,
        'image': image,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt
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
        'id': id,
        'vehicle_category': vehicleCategory,
        'name': name,
        'name_bn': nameBn,
        'slug': slug,
        'capacity': capacity,
        'image': image,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}

class TripStartHistory {
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
  final int? amount;
  final Category? category;
  final Vehicle? vehicle;

  TripStartHistory({
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
    this.amount,
    this.category,
    this.vehicle,
  });

  TripStartHistory.fromJson(Map<String, dynamic> json)
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
        updatedAt = json['updated_at'] as String?,
        amount = json['amount'] as int?,
        category = (json['category'] as Map<String, dynamic>?) != null
            ? Category.fromJson(json['category'] as Map<String, dynamic>)
            : null,
        vehicle = (json['vehicle'] as Map<String, dynamic>?) != null
            ? Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'category_id': categoryId,
        'vehicle_id': vehicleId,
        'pickup_location': pickupLocation,
        'via_location': viaLocation,
        'dropoff_location': dropoffLocation,
        'address_id': addressId,
        'is_hourly': isHourly,
        'hours': hours,
        'map': map,
        'dropoff_map': dropoffMap,
        'district_id': districtId,
        'port_id': portId,
        'datetime': datetime,
        'round_trip': roundTrip,
        'promo_key': promoKey,
        'round_datetime': roundDatetime,
        'note': note,
        'tracking_id': trackingId,
        'is_airport': isAirport,
        'status': status,
        'biding': biding,
        'biding_expired_at': bidingExpiredAt,
        'is_cancel': isCancel,
        'cancelreason_id': cancelreasonId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'amount': amount,
        'category': category?.toJson(),
        'vehicle': vehicle?.toJson()
      };
}

class TripCompleteHistory {
  final int? id;
  final int? customerId;
  final int? categoryId;
  final dynamic vehicleId;
  final String? pickupLocation;
  final dynamic viaLocation;
  final String? dropoffLocation;
  final dynamic addressId;
  final int? isHourly;
  final int? hours;
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
  final int? amount;
  final Category? category;
  final Vehicle? vehicle;

  TripCompleteHistory({
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
    this.amount,
    this.category,
    this.vehicle,
  });

  TripCompleteHistory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        customerId = json['customer_id'] as int?,
        categoryId = json['category_id'] as int?,
        vehicleId = json['vehicle_id'],
        pickupLocation = json['pickup_location'] as String?,
        viaLocation = json['via_location'],
        dropoffLocation = json['dropoff_location'] as String?,
        addressId = json['address_id'],
        isHourly = json['is_hourly'] as int?,
        hours = json['hours'] as int?,
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
        updatedAt = json['updated_at'] as String?,
        amount = json['amount'] as int?,
        category = (json['category'] as Map<String, dynamic>?) != null
            ? Category.fromJson(json['category'] as Map<String, dynamic>)
            : null,
        vehicle = (json['vehicle'] as Map<String, dynamic>?) != null
            ? Vehicle.fromJson(json['category'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'category_id': categoryId,
        'vehicle_id': vehicleId,
        'pickup_location': pickupLocation,
        'via_location': viaLocation,
        'dropoff_location': dropoffLocation,
        'address_id': addressId,
        'is_hourly': isHourly,
        'hours': hours,
        'map': map,
        'dropoff_map': dropoffMap,
        'district_id': districtId,
        'port_id': portId,
        'datetime': datetime,
        'round_trip': roundTrip,
        'promo_key': promoKey,
        'round_datetime': roundDatetime,
        'note': note,
        'tracking_id': trackingId,
        'is_airport': isAirport,
        'status': status,
        'biding': biding,
        'biding_expired_at': bidingExpiredAt,
        'is_cancel': isCancel,
        'cancelreason_id': cancelreasonId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'amount': amount,
        'category': category?.toJson(),
        'vehicle': vehicle
      };
}

class TripCancelHistory {
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
  final int? amount;
  final Category? category;
  final Vehicle? vehicle;

  TripCancelHistory({
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
    this.amount,
    this.category,
    this.vehicle,
  });

  TripCancelHistory.fromJson(Map<String, dynamic> json)
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
        updatedAt = json['updated_at'] as String?,
        amount = json['amount'] as int?,
        category = (json['category'] as Map<String, dynamic>?) != null
            ? Category.fromJson(json['category'] as Map<String, dynamic>)
            : null,
        vehicle = (json['vehicle'] as Map<String, dynamic>?) != null
            ? Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'category_id': categoryId,
        'vehicle_id': vehicleId,
        'pickup_location': pickupLocation,
        'via_location': viaLocation,
        'dropoff_location': dropoffLocation,
        'address_id': addressId,
        'is_hourly': isHourly,
        'hours': hours,
        'map': map,
        'dropoff_map': dropoffMap,
        'district_id': districtId,
        'port_id': portId,
        'datetime': datetime,
        'round_trip': roundTrip,
        'promo_key': promoKey,
        'round_datetime': roundDatetime,
        'note': note,
        'tracking_id': trackingId,
        'is_airport': isAirport,
        'status': status,
        'biding': biding,
        'biding_expired_at': bidingExpiredAt,
        'is_cancel': isCancel,
        'cancelreason_id': cancelreasonId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'amount': amount,
        'category': category?.toJson(),
        'vehicle': vehicle?.toJson()
      };
}
