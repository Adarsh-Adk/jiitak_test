import 'package:equatable/equatable.dart';

class CustomDate extends Equatable {
  final String? date;
  final String? label;
  final DateTime? dateTime;

  const CustomDate(
      {required this.date, required this.label, required this.dateTime});

  @override
  List<Object?> get props => [date, label, dateTime];
}
