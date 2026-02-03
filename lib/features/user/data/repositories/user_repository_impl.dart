import 'package:dartz/dartz.dart';
import 'package:clean_architecture/core/connection/network_info.dart';
import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/params/user_params.dart';
import 'package:clean_architecture/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture/features/user/domain/entities/user_entity.dart';
import 'package:clean_architecture/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final result = await remoteDataSource.getUser(params: params);
        await localDataSource.cacheUser(result);
        return Right(result);
      } on ServerException catch (e) {
        return Left(Failure(errorMessage: e.errorModel.message));
      } catch (e) {
        return Left(Failure(errorMessage: 'Unexpected Error'));
      }
    } else {
      try {
        final localUser = await localDataSource.getCachedUser();
        return Right(localUser);
      } on CacheException catch (e) {
        return Left(Failure(errorMessage: e.errorMessage));
      } catch (e) {
        return Left(Failure(errorMessage: 'Unexpected Error'));
      }
    }
  }
}
