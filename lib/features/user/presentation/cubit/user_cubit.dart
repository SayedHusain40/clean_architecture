import 'package:clean_architecture/core/params/user_params.dart';
import 'package:clean_architecture/features/user/domain/usecases/get_user.dart';
import 'package:clean_architecture/features/user/presentation/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserCubit extends Cubit<UserState> {
  final GetUser getUser;

  UserCubit(this.getUser) : super(UserInitial());

  Future<void> getUserById(int id) async {
    emit(UserLoading());

    final result = await getUser(
      params: UserParams(id: id.toString()),
    );

    result.fold(
      (failure) => emit(GetUserFailure(failure.errorMessage)),
      (user) => emit(GetUserSuccessful(userEntity: user)),
    );
  }
}


// class UserCubit extends Cubit<UserState> {
//   UserCubit() : super(UserInitial());

//   Future eitherFailureOrUser(int id) async {
//     emit(UserLoading());

//     final failureOrUser = await GetUser(
//       userRepository: UserRepositoryImpl(
//         networkInfo: NetworkInfoImpl(DataConnectionChecker()),
//         remoteDataSource: UserRemoteDataSource(api: DioApiClient(dio: Dio())),
//         localDataSource: UserLocalDataSource(cache: CacheHelper()),
//       ),
//     ).call(params: UserParams(id: id.toString()));

//     failureOrUser.fold(
//       (failure) => emit(GetUserFailure(failure.errorMessage)),
//       (user) => emit(GetUserSuccessful(userEntity: user)),
//     );
//   }
// }
