import 'package:clean_architecture/core/network/api/api_client.dart';
import 'package:clean_architecture/core/network/api/end_points.dart';
import 'package:clean_architecture/core/params/user_params.dart';
import 'package:clean_architecture/features/user/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiClient api;
  UserRemoteDataSource({required this.api});

  Future<UserModel> getUser({required UserParams params}) async {
    final response = await api.get("${EndPoints.getCurrentUser}/${params.id}");
    return UserModel.fromJson(response);
  }
}
