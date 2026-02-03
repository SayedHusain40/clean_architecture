import 'package:clean_architecture/features/user/domain/entities/user_entity.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class GetUserSuccessful extends UserState {
  final UserEntity userEntity;
  GetUserSuccessful({required this.userEntity});
}

class GetUserFailure extends UserState {
  final String message;
  GetUserFailure(this.message);
}
