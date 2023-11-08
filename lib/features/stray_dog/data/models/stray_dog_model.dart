// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:perros_sos/features/stray_dog/domain/entities/stray_dog.dart';

class StrayDogModel extends StrayDogEntity {
  const StrayDogModel({
    String? id,
    DateTime? reportDate,
    String? address,
    String? photoUrl,
    String? description,
    String? gender,
    bool? isActive,
  });

  factory StrayDogModel.fromJson(Map<String, dynamic> json) => StrayDogModel(
        id: json["id"],
        reportDate: json["reportDate"] == null
            ? null
            : DateTime.parse(json["reportDate"]),
        address: json["address"],
        photoUrl: json["photoUrl"],
        description: json["description"],
        gender: json["gender"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reportDate": reportDate?.toIso8601String(),
        "address": address,
        "photoUrl": photoUrl,
        "description": description,
        "gender": gender,
        "isActive": isActive,
      };
}
