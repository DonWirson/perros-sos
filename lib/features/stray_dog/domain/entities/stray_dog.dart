import 'package:equatable/equatable.dart';

class StrayDogEntity extends Equatable {
  final String? id;
  final DateTime? reportDate;
  final String? address;
  final String? photoUrl;
  final String? description;
  final String? gender;
  final bool? isActive;

  const StrayDogEntity({
    this.id,
    this.reportDate,
    this.address,
    this.photoUrl,
    this.description,
    this.gender,
    this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        reportDate,
        address,
        photoUrl,
        description,
        gender,
        isActive,
      ];
}
