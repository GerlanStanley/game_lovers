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

    options.headers["Accept"] = "application/json";
    options.headers["Authorization"] = "Bearer $accessToken";
    options.headers["Client-ID"] = ApiConstants.clientId;

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
        await _auth(requestOptions: err.requestOptions);
        var response = await _dio.request(
          err.requestOptions.path,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          ),
        );
        return handler.resolve(response);
      } on DioError catch (e) {
        printDebug(e.response?.realUri);
        printDebug(e.response?.requestOptions.data);
        printDebug(e.response?.statusCode);
        printDebug(e.response?.data);
      }
    }

    return handler.next(err);
  }

  Future _auth({required RequestOptions requestOptions}) async {
    var response = await _dio.post(
      ApiConstants.apiAuthUrlPrefix,
      queryParameters: {
        "client_id": ApiConstants.clientId,
        "grant_type": "client_credentials",
        "client_secret": ApiConstants.clientSecret,
      },
    );

    printDebug(response.data["access_token"]);

    _prefs.setString(
      PrefsKeysConstants.accessToken,
      response.data["access_token"],
    );
  }
}
