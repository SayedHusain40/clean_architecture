import 'package:dartz/dartz.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/params/user_params.dart';
import 'package:clean_architecture/features/user/domain/entities/user_entity.dart';
import 'package:clean_architecture/features/user/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository userRepository;
  GetUser({required this.userRepository});

  Future<Either<Failure, UserEntity>> call({required UserParams params}) {
    return userRepository.getUser(params: params);
  }
}
