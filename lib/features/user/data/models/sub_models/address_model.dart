import 'package:clean_architecture/core/databases/api/end_points.dart';
import 'package:clean_architecture/features/user/domain/entities/sub_entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({required super.home});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(home: json[ApiKey.street]);
  }

  Map<String, dynamic> toJson() {
    return {ApiKey.street: home};
  }
}
