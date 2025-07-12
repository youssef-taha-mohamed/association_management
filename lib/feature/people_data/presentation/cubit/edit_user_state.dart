part of 'edit_user_cubit.dart';

sealed class EditUserState {}

final class EditUserInitial extends EditUserState {}

class EditUserLoading extends EditUserState {}

class EditUserSuccess extends EditUserState {
  final User user;
  final String message;
  EditUserSuccess(this.user, this.message);
}

class EditUserError extends EditUserState {
  final String message;
  EditUserError(this.message);
}