class TravelModel {
  final String? status;
  final List<Data>? data;
  final TouristBus? touristBus;
  final LuxurySuvCar? luxurySuvCar;

  TravelModel({
    this.status,
    this.data,
    this.touristBus,
    this.luxurySuvCar,
  });

  TravelModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        touristBus = (json['tourist_bus'] as Map<String,dynamic>?) != null ? TouristBus.fromJson(json['tourist_bus'] as Map<String,dynamic>) : null,
        luxurySuvCar = (json['luxury_suv_car'] as Map<String,dynamic>?) != null ? LuxurySuvCar.fromJson(json['luxury_suv_car'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.map((e) => e.toJson()).toList(),
    'tourist_bus' : touristBus?.toJson(),
    'luxury_suv_car' : luxurySuvCar?.toJson()
  };
}

class Data {
  final int? id;
  final String? type;
  final String? title;
  final String? description;
  final String? phone;
  final String? thumbnailImage;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final List<TravelImages>? travelImages;

  Data({
    this.id,
    this.type,
    this.title,
    this.description,
    this.phone,
    this.thumbnailImage,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.travelImages,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        phone = json['phone'] as String?,
        thumbnailImage = json['thumbnail_image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        travelImages = (json['travel_images'] as List?)?.map((dynamic e) => TravelImages.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'title' : title,
    'description' : description,
    'phone' : phone,
    'thumbnail_image' : thumbnailImage,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'travel_images' : travelImages?.map((e) => e.toJson()).toList()
  };
}

class TravelImages {
  final int? id;
  final int? travelId;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  TravelImages({
    this.id,
    this.travelId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  TravelImages.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        travelId = json['travel_id'] as int?,
        image = json['image'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'travel_id' : travelId,
    'image' : image,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class TouristBus {
  final int? id;
  final String? type;
  final String? title;
  final String? description;
  final String? phone;
  final String? thumbnailImage;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final List<TravelImages>? travelImages;

  TouristBus({
    this.id,
    this.type,
    this.title,
    this.description,
    this.phone,
    this.thumbnailImage,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.travelImages,
  });

  TouristBus.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        phone = json['phone'] as String?,
        thumbnailImage = json['thumbnail_image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        travelImages = (json['travel_images'] as List?)?.map((dynamic e) => TravelImages.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'title' : title,
    'description' : description,
    'phone' : phone,
    'thumbnail_image' : thumbnailImage,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'travel_images' : travelImages?.map((e) => e.toJson()).toList()
  };
}

class LuxurySuvCar {
  final int? id;
  final String? type;
  final String? title;
  final String? description;
  final String? phone;
  final String? thumbnailImage;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final List<TravelImages>? travelImages;

  LuxurySuvCar({
    this.id,
    this.type,
    this.title,
    this.description,
    this.phone,
    this.thumbnailImage,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.travelImages,
  });

  LuxurySuvCar.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        phone = json['phone'] as String?,
        thumbnailImage = json['thumbnail_image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        travelImages = (json['travel_images'] as List?)?.map((dynamic e) => TravelImages.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'title' : title,
    'description' : description,
    'phone' : phone,
    'thumbnail_image' : thumbnailImage,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'travel_images' : travelImages?.map((e) => e.toJson()).toList()
  };
}
