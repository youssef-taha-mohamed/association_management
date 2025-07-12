import 'package:get_it/get_it.dart';
import '../../core/authentication/cache/disk/hive.dart';
import '../../core/authentication/delegates/rxdart/authentication.dart';
import '../../core/network/client/dio/dio.dart';
import '../../feature/auth/data/data_sources/remote/data_source.dart';
import '../../feature/auth/data/repositories/authentication.dart';
import '../../feature/user/data/data_sources/remote/data_source.dart';
import '../../feature/user/data/repositories/user.dart';
import '../../shared/cubits/config/config_cubit.dart';
import '../../shared/data/config_data/data_source/config_data_source.dart';
import '../../shared/data/config_data/repo/config_repo.dart';
import '../network/response_handler/management/response_handler.dart';

final class DependencyInjector {
  const DependencyInjector();

  static final GetIt _sl = GetIt.instance;

  static void reset() => _sl.reset();

  static void setup() {
    // region Config
    _sl
      ..registerLazySingleton<DioNetworkClient>(
        DioNetworkClient.new,
      )
      ..registerLazySingleton<HiveAuthenticationCache>(() {
        return HiveAuthenticationCache();
      })
      ..registerLazySingleton<ManagementResponseHandler>(() {
        return const ManagementResponseHandler();
      })

      /// region Repository
      ..registerLazySingleton<AuthenticationRepository>(() {
        return AuthenticationRepository(
          dataSource: DependencyInjector._authenticationRemoteDataSource,
        );
      })
      ..registerLazySingleton<UserRepository>(() {
        return UserRepository(
          dataSource: DependencyInjector._userRemoteDataSource,
        );
      })
      ..registerLazySingleton<ConfigRepo>(() {
        return ConfigRepo(
          configDataSource: DependencyInjector._configDataSource,
        );
      })
      // region DataSources
      ..registerLazySingleton<UserRemoteDataSource>(() {
        return UserRemoteDataSource(
          client: DependencyInjector._dioNetworkClient,
          responseHandler: DependencyInjector._managementResponseHandler,
        );
      })
      ..registerLazySingleton<AuthenticationDelegateWithRxdart>(() {
        return AuthenticationDelegateWithRxdart(
          authRepository: DependencyInjector.authenticationRepository,
          userRepository: DependencyInjector.userRepository,
          cache: DependencyInjector._hiveAuthenticationCache,
        );
      })
      ..registerLazySingleton<AuthenticationRemoteDataSource>(() {
        return AuthenticationRemoteDataSource(
          client: DependencyInjector._dioNetworkClient,
          responseHandler: DependencyInjector._managementResponseHandler,
        );
      })
      ..registerLazySingleton<ConfigDataSource>(() {
        return ConfigDataSource(
          responseHandler: DependencyInjector._managementResponseHandler,
          client: DependencyInjector._dioNetworkClient,
        );
      })

    // region Cubits
      ..registerLazySingleton<ConfigCubit>(
            () => ConfigCubit(
          DependencyInjector.configRepo,
        ),
      );
  }

  // region Configs Name
  static DioNetworkClient get _dioNetworkClient {
    return _sl.get<DioNetworkClient>();
  }

  static HiveAuthenticationCache get _hiveAuthenticationCache {
    return _sl<HiveAuthenticationCache>();
  }

  static ManagementResponseHandler get _managementResponseHandler {
    return _sl<ManagementResponseHandler>();
  }
  static AuthenticationDelegateWithRxdart get authenticationDelegateWithRxdart {
    return _sl<AuthenticationDelegateWithRxdart>();
  }

  // region Repository Names

  static AuthenticationRepository get authenticationRepository {
    return _sl<AuthenticationRepository>();
  }

  static UserRepository get userRepository {
    return _sl<UserRepository>();
  }
  static ConfigRepo get configRepo {
    return _sl<ConfigRepo>();
  }


  // region DataSources Names
  static AuthenticationRemoteDataSource get _authenticationRemoteDataSource {
    return _sl<AuthenticationRemoteDataSource>();
  }
  static UserRemoteDataSource get _userRemoteDataSource {
    return _sl<UserRemoteDataSource>();
  }
  static ConfigDataSource get _configDataSource {
    return _sl<ConfigDataSource>();
  }

  // region Cubits Names
  static ConfigCubit get configCubit {
    return _sl<ConfigCubit>();
  }
}
