import 'package:clean_architecture/core/databases/api/dio_api_client.dart';
import 'package:dio/dio.dart';

class ApiService {
  static final Dio dio = Dio();
  static final DioApiClient dioApiClient  = DioApiClient(dio: dio);
}
