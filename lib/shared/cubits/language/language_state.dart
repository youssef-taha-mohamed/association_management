part of 'language_cubit.dart';

enum ChooseLanguageState { initial, loading, languageSet, error }

class LanguageState {
  final ChooseLanguageState status;
  final String? errorMessage;
  final String languageCode;

  const LanguageState({
    this.status = ChooseLanguageState.initial,
    this.errorMessage,
    this.languageCode = 'ar',
  });

  LanguageState copyWith({
    ChooseLanguageState? status,
    String? errorMessage,
    String? languageCode,
  }) {
    return LanguageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  @override
  String toString() =>
      'ChooseLanguageState(status: $status, errorMessage: $errorMessage , languageCode: $languageCode)';

  @override
  bool operator ==(covariant LanguageState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.errorMessage == errorMessage &&
        other.languageCode == languageCode;
  }

  @override
  int get hashCode => status.hashCode ^ errorMessage.hashCode;

  bool get isInitial => status == ChooseLanguageState.initial;

  bool get isLoading => status == ChooseLanguageState.loading;

  bool get isLanguageSet => status == ChooseLanguageState.languageSet;

  bool get isError => status == ChooseLanguageState.error;
}
