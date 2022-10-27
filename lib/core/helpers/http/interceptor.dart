import 'package:dio/dio.dart';

import '../../constants/constants.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "application/json";

    options.baseUrl = ApiConstants.apiUrlPrefix;

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    var response = err.response;

    if (response != null &&
        response.statusCode != null &&
        response.statusCode == 401) {
      //
      
    }
  }
}
