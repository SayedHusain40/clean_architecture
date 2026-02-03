import 'package:dartz/dartz.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/params/user_params.dart';
import 'package:clean_architecture/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
}
