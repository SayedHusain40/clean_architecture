import 'package:clean_architecture/core/cache/cache_helper.dart';
import 'package:clean_architecture/core/network/api/api_client.dart';
import 'package:clean_architecture/core/network/api/dio_api_client.dart';
import 'package:clean_architecture/core/network/connection/network_info.dart';
import 'package:clean_architecture/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture/features/user/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture/features/user/domain/repositories/user_repository.dart';
import 'package:clean_architecture/features/user/domain/usecases/get_user.dart';
import 'package:clean_architecture/features/user/presentation/cubit/user_cubit.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  // Core
  sl.registerLazySingleton(() => CacheHelper(sl()));

  // Cubit
  sl.registerFactory(() => UserCubit(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetUser(userRepository: sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(api: sl()),
  );
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSource(cache: sl()),
  );

  // Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiClient>(() => DioApiClient(dio: sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
}
