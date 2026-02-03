import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:clean_architecture/core/connection/network_info.dart';
import 'package:clean_architecture/core/databases/api/dio_api_client.dart';
import 'package:clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:clean_architecture/core/params/user_params.dart';
import 'package:clean_architecture/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture/features/user/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture/features/user/domain/usecases/get_user.dart';
import 'package:clean_architecture/features/user/presentation/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future eitherFailureOrUser(int id) async {
    emit(UserLoading());

    final failureOrUser = await GetUser(
      userRepository: UserRepositoryImpl(
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        remoteDataSource: UserRemoteDataSource(api: DioApiClient(dio: Dio())),
        localDataSource: UserLocalDataSource(cache: CacheHelper()),
      ),
    ).call(params: UserParams(id: id.toString()));

    failureOrUser.fold(
      (failure) => emit(GetUserFailure(failure.errorMessage)),
      (user) => emit(GetUserSuccessful(userEntity: user)),
    );
  }
}
