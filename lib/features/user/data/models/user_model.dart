import 'package:clean_architecture/core/network/api/end_points.dart';
import 'package:clean_architecture/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  // final AddressModel addressModel;
  const UserModel({
    required super.name,
    required super.email,
    required this.id,
    // required this.addressModel,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      email: json[ApiKey.email],
      // addressModel: AddressModel.fromJson(json[ApiKey.address]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.email: email,
      // ApiKey.address: addressModel.toJson(),
    };
  }
}
