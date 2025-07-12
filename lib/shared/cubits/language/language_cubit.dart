import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/db/kv_db/hive.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
      : super(const LanguageState()) {
    init();
  }

  void init() async {
    final languageCode = HiveDatabase.getLanguageCode();
    if (languageCode != null) {
      emit(state.copyWith(languageCode: languageCode));
    }
  }

  Future<void> saveLanguageCode(String languageCode) async {
    emit(state.copyWith(status: ChooseLanguageState.loading));
    try {
      await HiveDatabase.setLanguageCode(languageCode);
      emit(state.copyWith(
          languageCode: languageCode,
          status: ChooseLanguageState.languageSet));
    } catch (e) {
      emit(state.copyWith(
          status: ChooseLanguageState.error, errorMessage: e.toString()));
    }
  }
}
