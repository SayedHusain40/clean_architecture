import 'package:clean_architecture/core/secrets/app_secrets.dart';

class EndPoints {
  static String baseUrl = "https://jsonplaceholder.typicode.com";
  static const String uploadAvatar = '/storage/buckets/${AppSecrets.appwriteBucketId}/files';
  static String signUp = "/account";
  static String signIn = "/account/sessions/email";
  static const String getCurrentUser = '/users';
  static const String signout = '/account/sessions/current';
  static const String deleteUser = '/account';
  static const String posts = '/posts';
}

class ApiKey {
  static String id = 'id';
  static String address = 'address';
  static String street = 'street';
  static String title = 'title';
  static String body = 'body';

  static String code = 'code';
  static String message = 'message';
  static String type = 'type';
  static String userId = "userId";
  static String name = "name";
  static String email = "email";
  static String password = "password";

}
