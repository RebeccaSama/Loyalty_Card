import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/features/login/controller/auth_controller.dart';

class AuthInterceptor extends Interceptor {
  final Ref ref;

  AuthInterceptor(this.ref);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Ne pas ajouter de token pour les routes d'authentification
    if (options.path.contains('/auth/login') ||
        options.path.contains('/auth/register') ||
        options.path.contains('/auth/refresh-token')) {
      return handler.next(options);
    }

    final authController = ref.read(authControllerProvider);
    final token = await authController.getValidToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // Token expiré ou invalide
      final authController = ref.read(authControllerProvider);
      final refreshSuccess = await authController.refreshToken();

      if (refreshSuccess) {
        // Réessayer la requête originale avec le nouveau token
        final token = await authController.getValidToken();
        final opts = err.requestOptions;
        opts.headers['Authorization'] = 'Bearer $token';

        try {
          final response = await Dio().fetch(opts);
          return handler.resolve(response);
        } on DioException catch (e) {
          return handler.next(e);
        }
      }
    }
    return handler.next(err);
  }
}
