import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/person.dart';
part 'distribution_state.dart';

class DistributionCubit extends Cubit<DistributionState> {
  DistributionCubit() : super(DistributionInitial());
  void searchPeople(int count, String region) async {
    emit(DistributionLoading());

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Mock data - replace with actual API call
    final people = List.generate(count, (index) => Person(
      id: 'person_$index',
      beneficiaryName: index == 0 ? 'tester' : 'أحمد ${index == 1 ? 'ياسر' : 'السيد'}',
      guardianName: index == 0 ? 'TESTER' : index == 1 ? 'TEST' : 'منزل السيد',
      relationship: index == 0 ? 'صفة' : index == 1 ? 'سبت' : 'صفة',
      status: 'نشط',
    ));

    emit(DistributionSearchResult(
      people: people,
      searchCount: count,
      searchRegion: region,
    ));
  }

  void proceedToBagAssignment() {
    if (state is DistributionSearchResult) {
      final currentState = state as DistributionSearchResult;
      emit(DistributionBagAssignment(
        people: currentState.people,
        availableBags: [],
      ));
    }
  }

  void addBagItem(String content, int quantity, String size) {
    if (state is DistributionBagAssignment) {
      final currentState = state as DistributionBagAssignment;
      final newBag = BagItem(content: content, quantity: quantity, size: size);
      final updatedBags = List<BagItem>.from(currentState.availableBags)..add(newBag);

      emit(DistributionBagAssignment(
        people: currentState.people,
        availableBags: updatedBags,
      ));
    }
  }

  void assignBagsToPeople() {
    if (state is DistributionBagAssignment) {
      final currentState = state as DistributionBagAssignment;
      final updatedPeople = currentState.people.map((person) =>
          person.copyWith(bags: currentState.availableBags)
      ).toList();

      emit(DistributionBagAssignment(
        people: updatedPeople,
        availableBags: currentState.availableBags,
      ));
    }
  }

  void resetToSearch() {
    emit(DistributionInitial());
  }
}
