import 'package:equatable/equatable.dart';

class Stamp extends Equatable {
  final DateTime? dateTime;
  final String? description;
  final String? trailing;

  const Stamp(
      {required this.dateTime,
      required this.description,
      required this.trailing});

  @override
  List<Object?> get props => [dateTime, description, trailing];
}
