import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/entity/user_credentials.dart';

@injectable
class AuthApi {
  Future<bool> login({required UserCredentials userCredentials}) async {
    await Future.delayed(const Duration(seconds: 2));
    const validationUser = UserCredentials(
      email: 'user@user.com',
      password: 'userPassword',
    );

    if (userCredentials.email != validationUser.email ||
        userCredentials.password != validationUser.password) {
      throw DioException(
        requestOptions: RequestOptions(
          path: '',
        ),
        type: DioExceptionType.badResponse,
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(
            path: '',
          ),
          data: {
            "detail": 'Wrong email or password',
            "service": runtimeType.toString(),
          },
        ),
      );
    }
    return true;
  }
}
