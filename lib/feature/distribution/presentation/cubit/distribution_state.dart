part of 'distribution_cubit.dart';

abstract class DistributionState extends Equatable {
  const DistributionState();

  @override
  List<Object> get props => [];
}

class DistributionInitial extends DistributionState {}

class DistributionLoading extends DistributionState {}

class DistributionSearchResult extends DistributionState {
  final List<Person> people;
  final int searchCount;
  final String searchRegion;

  const DistributionSearchResult({
    required this.people,
    required this.searchCount,
    required this.searchRegion,
  });

  @override
  List<Object> get props => [people, searchCount, searchRegion];
}

class DistributionBagAssignment extends DistributionState {
  final List<Person> people;
  final List<BagItem> availableBags;

  const DistributionBagAssignment({
    required this.people,
    required this.availableBags,
  });

  @override
  List<Object> get props => [people, availableBags];
}

