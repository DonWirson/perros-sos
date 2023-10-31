import 'dart:convert';

class StrayDogModel {
  String id;
  DateTime reportDate;
  String address;
  String? photoUrl;
  String? description;
  String? gender;
  bool isActive;

  StrayDogModel({
    required this.id,
    required this.reportDate,
    required this.address,
    this.photoUrl,
    this.description,
    this.gender,
    required this.isActive,
  });

  factory StrayDogModel.fromRawJson(String str) =>
      StrayDogModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StrayDogModel.fromJson(Map<String, dynamic> json) => StrayDogModel(
        id: json["id"],
        reportDate: DateTime.parse(json["reportDate"]),
        address: json["address"],
        photoUrl: json["photoUrl"],
        description: json["description"],
        gender: json["gender"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reportDate": reportDate.toIso8601String(),
        "address": address,
        "photoUrl": photoUrl,
        "description": description,
        "gender": gender,
        "isActive": isActive,
      };
}
