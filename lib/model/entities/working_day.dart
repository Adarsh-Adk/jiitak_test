import 'package:equatable/equatable.dart';

class WorkingDay extends Equatable {
  final String? day;

  const WorkingDay({required this.day});

  @override
  List<Object?> get props => [day];
}
