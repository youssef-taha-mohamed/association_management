import 'package:flutter_bloc/flutter_bloc.dart';
part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

  void toggleExpansion(String itemKey) {
    final newExpandedItems = Map<String, bool>.from(state.expandedItems);

    // إغلاق جميع العناصر الأخرى
    newExpandedItems.updateAll((key, value) => false);

    // فتح العنصر المحدد أو إغلاقه
    final currentValue = state.expandedItems[itemKey] ?? false;
    newExpandedItems[itemKey] = !currentValue;

    emit(state.copyWith(expandedItems: newExpandedItems));
  }

  void collapseAll() {
    final newExpandedItems = Map<String, bool>.from(state.expandedItems);
    newExpandedItems.updateAll((key, value) => false);
    emit(state.copyWith(expandedItems: newExpandedItems));
  }
}
