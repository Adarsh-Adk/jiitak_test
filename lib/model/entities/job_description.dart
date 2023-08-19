import 'package:equatable/equatable.dart';

class JobDescription extends Equatable {
  final int? id;
  final String? image;
  final String? title;
  final String? typeOfCare;
  final double? salary;
  final DateTime? date;
  final DateTime? startTime;
  final DateTime? endTime;
  final String? address;
  final String? notes;
  final String? employer;
  final bool? isFavorite;

  const JobDescription(
      {required this.id,
      required this.image,
      required this.title,
      required this.typeOfCare,
      required this.salary,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.address,
      required this.notes,
      required this.employer,
      required this.isFavorite});

  @override
  List<Object?> get props => [
        id,
        image,
        title,
        typeOfCare,
        salary,
        date,
        startTime,
        endTime,
        address,
        notes,
        employer,
        isFavorite
      ];
}
