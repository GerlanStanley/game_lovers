import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constants.dart';
import '../../utils/utils.dart';

class CustomInterceptor extends InterceptorsWrapper {
  final Dio _dio;
  final SharedPreferences _prefs;

  CustomInterceptor(this._dio, this._prefs);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var accessToken = _prefs.getString(PrefsKeysConstants.accessToken);

    options.headers["Authorization"] = "Bearer: $accessToken";
    options.headers["Accept"] = "application/json";

    options.baseUrl = ApiConstants.apiUrlPrefix;

    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    var response = err.response;

    if (response != null &&
        response.statusCode != null &&
        response.statusCode == 401) {
      //
      try {
        var response = await _dio.post(
          ApiConstants.apiAuthUrlPrefix,
          data: {
            "client_id": ApiConstants.clientId,
            "client_secret": ApiConstants.clientSecret,
            "grant_type": "client_credentials",
          },
        );

        if (response.statusCode == 200) {
          _prefs.setString(
            PrefsKeysConstants.accessToken,
            response.data["access_token"],
          );

          final options = Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          );

          return _dio.request<dynamic>(
            err.requestOptions.path,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
            options: options,
          );
        }
      } catch (e) {
        printDebug(e.toString());
      }
    }
  }
}
