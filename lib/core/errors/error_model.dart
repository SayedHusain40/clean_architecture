import 'package:clean_architecture/core/network/api/end_points.dart';

class ErrorModel {
  final int code;
  final String type;
  final String message;

  ErrorModel({required this.code, required this.type, required this.message});
  
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      message: jsonData[ApiKey.message],
      code: jsonData[ApiKey.code],
      type: jsonData[ApiKey.type],
    );
  }
}
