import 'package:equatable/equatable.dart';

class Projects extends Equatable{
  final String name;
  final String income;
  final String beneficiary;

 const Projects({
    required this.name,
    required this.income,
    required this.beneficiary,
  });

  @override
  List<Object?> get props => [
    name,
    income,
    beneficiary,
  ];
}
