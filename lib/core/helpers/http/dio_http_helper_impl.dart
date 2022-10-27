import 'package:dio/dio.dart';

import '../../failures/failures.dart';
import '../../utils/utils.dart';

import 'http.dart';

class DioHttpHelperImpl implements IHttpHelper {
  final Dio _dio;
  final Interceptor _interceptor;

  DioHttpHelperImpl(this._dio, this._interceptor) {
    _dio.interceptors.add(_interceptor);
  }

  @override
  Future<dynamic> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.get(path, queryParameters: queryParameters);

      logRequest(response);

      return response.data;
    } on DioError catch (e) {
      validateCode(e);
    }
  }

  @override
  Future<dynamic> post<T>(
    String path, {
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      var response = await _dio.post<T>(path, data: data);

      logRequest(response);

      return response.data;
    } on DioError catch (e) {
      validateCode(e);
    }
  }

  @override
  Future<dynamic> put<T>(
    String path, {
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      var response = await _dio.put<T>(path, data: data);

      logRequest(response);

      return response.data;
    } on DioError catch (e) {
      validateCode(e);
    }
  }

  @override
  Future<dynamic> delete<T>(String path, {String? token}) async {
    try {
      var response = await _dio.delete<T>(path);

      logRequest(response);

      return response.data;
    } on DioError catch (e) {
      validateCode(e);
    }
  }

  dynamic validateCode(DioError error) {
    logRequest(error.response);

    String? message;
    if (error.response?.data is Map) {
      message = ErrorApiUtils.parse(error.response!.data);
    }

    if (error.response?.statusCode == 400) {
      throw BadRequestHttpFailure(message: message ?? "Erro na requisição");
    } else if (error.response?.statusCode == 401) {
      throw UnauthorizedHttpFailure(message: message ?? "Erro na requisição");
    } else if (error.response?.statusCode == 404) {
      throw NotFoundHttpFailure(message: message ?? "Erro na requisição");
    } else if (error.response?.statusCode == 500) {
      throw ServerHttpFailure(message: message ?? "Erro na requisição");
    } else {
      throw HttpFailure(message: message ?? "Erro na requisição");
    }
  }

  void logRequest(Response? response) {
    printDebug(response?.realUri);
    printDebug(response?.requestOptions.data);
    printDebug(response?.statusCode);
    printDebug(response?.data);
  }
}
