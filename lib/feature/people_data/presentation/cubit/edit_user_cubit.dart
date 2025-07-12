import 'package:flutter_bloc/flutter_bloc.dart';
part 'edit_user_state.dart';

class EditUserCubit extends Cubit<EditUserState> {
  EditUserCubit() : super(EditUserInitial());

  void saveUser(User updatedUser) async {
    emit(EditUserLoading());

    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));
      emit(EditUserSuccess(updatedUser, 'تم حفظ التعديلات بنجاح'));
    } catch (e) {
      emit(EditUserError('حدث خطأ أثناء حفظ البيانات'));
    }
  }
}

// User Model
class User {
  final String id;
  final String name;
  final String department;
  final String role;
  final String password;
  final bool isActive;

  User({
    required this.id,
    required this.name,
    required this.department,
    required this.role,
    required this.password,
    required this.isActive,
  });

  User copyWith({
    String? id,
    String? name,
    String? department,
    String? role,
    String? password,
    bool? isActive,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      department: department ?? this.department,
      role: role ?? this.role,
      password: password ?? this.password,
      isActive: isActive ?? this.isActive,
    );
  }
}