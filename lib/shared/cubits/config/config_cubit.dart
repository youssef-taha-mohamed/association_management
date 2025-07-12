import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/constant.dart';
import '../../data/config_data/repo/config_repo.dart';
part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit(
    this._repo,
  ) : super(ConfigInitial());

  String? contactPhone;
  String? contactWhatsapp;
  String? iosVersion;
  String? androidVersion;
 
 

  final ConfigRepo _repo;

  static ConfigCubit get(context) => BlocProvider.of(context);
  Future<void> getConfig() async {
    try {
      emit(ConfigLoading());
      final data = await _repo.getConfig();
      contactPhone = data[Constants.contactPhone].toString();
      contactWhatsapp == data[Constants.contactWhatsapp].toString();
      iosVersion = data[Constants.iosVersion];
      androidVersion = data[Constants.androidVersion];
      
      
      emit(ConfigLoaded());
    } catch (error) {
      emit(ConfigError(error.toString()));
    }
  }
}
