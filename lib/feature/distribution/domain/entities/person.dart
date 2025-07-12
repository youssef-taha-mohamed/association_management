import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String id;
  final String beneficiaryName;
  final String guardianName;
  final String relationship;
  final String status;
  final List<BagItem> bags;

  const Person({
    required this.id,
    required this.beneficiaryName,
    required this.guardianName,
    required this.relationship,
    required this.status,
    this.bags = const [],
  });

  Person copyWith({
    String? id,
    String? beneficiaryName,
    String? guardianName,
    String? relationship,
    String? status,
    List<BagItem>? bags,
  }) {
    return Person(
      id: id ?? this.id,
      beneficiaryName: beneficiaryName ?? this.beneficiaryName,
      guardianName: guardianName ?? this.guardianName,
      relationship: relationship ?? this.relationship,
      status: status ?? this.status,
      bags: bags ?? this.bags,
    );
  }

  @override
  List<Object?> get props => [id, beneficiaryName, guardianName, relationship, status, bags];
}

class BagItem extends Equatable {
  final String content;
  final int quantity;
  final String size;

  const BagItem({
    required this.content,
    required this.quantity,
    required this.size,
  });

  @override
  List<Object?> get props => [content, quantity, size];
}