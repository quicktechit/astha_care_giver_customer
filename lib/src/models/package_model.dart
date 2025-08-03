class PackageModel {
  final String? status;
   List<CustomPackage>? weddingProgram;
   List<CustomPackage>? ambulanceFreezingcar;
   List<CustomPackage>? officepickDropservice;
   List<CustomPackage>? carMonthlyRent;

  PackageModel({
    this.status,
    this.weddingProgram,
    this.ambulanceFreezingcar,
    this.officepickDropservice,
    this.carMonthlyRent,
  });

  PackageModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        weddingProgram = (json['wedding_program'] as List?)?.map((dynamic e) => CustomPackage.fromJson(e as Map<String,dynamic>)).toList(),
        ambulanceFreezingcar = (json['ambulance_freezingcar'] as List?)?.map((dynamic e) => CustomPackage.fromJson(e as Map<String,dynamic>)).toList(),
        officepickDropservice = (json['officepick_dropservice'] as List?)?.map((dynamic e) => CustomPackage.fromJson(e as Map<String,dynamic>)).toList(),
        carMonthlyRent = (json['car_monthly_rent'] as List?)?.map((dynamic e) => CustomPackage.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'wedding_program' : weddingProgram?.map((e) => e.toJson()).toList(),
    'ambulance_freezingcar' : ambulanceFreezingcar?.map((e) => e.toJson()).toList(),
    'officepick_dropservice' : officepickDropservice?.map((e) => e.toJson()).toList(),
    'car_monthly_rent' : carMonthlyRent?.map((e) => e.toJson()).toList()
  };
}

class CustomPackage {
  final int? id;
  final String? type;
  final String? carName;
  final int? price;
  final String? thumbnailImage;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final List<OurpackageImages>? ourpackageImages;
  final List<OurpackageServices>? ourpackageServices;

  CustomPackage({
    this.id,
    this.type,
    this.carName,
    this.price,
    this.thumbnailImage,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.ourpackageImages,
    this.ourpackageServices,
  });

  CustomPackage.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String?,
        carName = json['car_name'] as String?,
        price = json['price'] as int?,
        thumbnailImage = json['thumbnail_image'] as String?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        ourpackageImages = (json['ourpackage_images'] as List?)?.map((dynamic e) => OurpackageImages.fromJson(e as Map<String,dynamic>)).toList(),
        ourpackageServices = (json['ourpackage_services'] as List?)?.map((dynamic e) => OurpackageServices.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'car_name' : carName,
    'price' : price,
    'thumbnail_image' : thumbnailImage,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'ourpackage_images' : ourpackageImages?.map((e) => e.toJson()).toList(),
    'ourpackage_services' : ourpackageServices?.map((e) => e.toJson()).toList()
  };
}

class OurpackageImages {
  final int? id;
  final int? ourpackageId;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  OurpackageImages({
    this.id,
    this.ourpackageId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  OurpackageImages.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        ourpackageId = json['ourpackage_id'] as int?,
        image = json['image'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'ourpackage_id' : ourpackageId,
    'image' : image,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class OurpackageServices {
  final int? id;
  final int? ourpackageId;
  final String? service;
  final String? createdAt;
  final String? updatedAt;

  OurpackageServices({
    this.id,
    this.ourpackageId,
    this.service,
    this.createdAt,
    this.updatedAt,
  });

  OurpackageServices.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        ourpackageId = json['ourpackage_id'] as int?,
        service = json['service'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'ourpackage_id' : ourpackageId,
    'service' : service,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}





