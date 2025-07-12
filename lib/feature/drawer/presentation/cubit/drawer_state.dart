part of 'drawer_cubit.dart';

class DrawerState {
  final Map<String, bool> expandedItems;

  DrawerState({Map<String, bool>? expandedItems})
    : expandedItems = expandedItems ?? {};

  DrawerState copyWith({Map<String, bool>? expandedItems}) {
    return DrawerState(expandedItems: expandedItems ?? this.expandedItems);
  }
}

final class DrawerInitial extends DrawerState {}
