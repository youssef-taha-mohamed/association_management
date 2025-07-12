part of 'config_cubit.dart';

sealed class ConfigState {}

final class ConfigInitial extends ConfigState {}

final class ConfigLoading extends ConfigState {}

final class ConfigLoaded extends ConfigState {}

final class ConfigError extends ConfigState {
  ConfigError(this.error);

  final String error;
}
