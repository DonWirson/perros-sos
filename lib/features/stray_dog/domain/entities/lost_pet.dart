// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'lost_pet_entities.dart';

class LostPet {
  int id;
  String name;
  DateTime reportDate;
  bool isActive;
  int animalTypeId;
  int genderId;
  AnimalType animalType;
  Gender gender;

  LostPet({
    required this.id,
    required this.name,
    required this.reportDate,
    required this.isActive,
    required this.animalTypeId,
    required this.genderId,
    required this.animalType,
    required this.gender,
  });
}
