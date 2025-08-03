class DivisionModel {
  DivisionModel({
    this.status,
    this.data,
  });

  final String? status;
  final List<DivisionList>? data;

  factory DivisionModel.fromJson(Map<String, dynamic> json) {
    return DivisionModel(
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<DivisionList>.from(
              json["data"]!.map((x) => DivisionList.fromJson(x))),
    );
  }
}

class DivisionList {
  DivisionList({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DivisionList.fromJson(Map<String, dynamic> json) {
    return DivisionList(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
