import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/models/user_model.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post(
      '/auth/register',
      {'name': name, 'email': email, 'password': password},
    );

    if (result.hasError) {
      var message = 'Erro ao registrar usuário';

      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message);
    }

    return UserModel.fromJson('source');
  }
}
