import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final String? accessToken;

  ApiInterceptor({this.accessToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['X-Appwrite-Project'] = AppSecrets.appwriteProjectId;
    options.headers['Content-Type'] = 'application/json';

    // final hasBody = options.data != null;
    // final isFormData = options.data is FormData;

    // if (hasBody && !isFormData) {
    //   options.headers['Content-Type'] = 'application/json';
    // }

    super.onRequest(options, handler);
  }
}
