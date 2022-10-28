abstract class IHttpHelper {
  Future<dynamic> get<T>(String path, {Map<String, dynamic>? queryParameters});

  Future<dynamic> post<T>(String path, {dynamic data});

  Future<dynamic> put<T>(String path, {Map<String, dynamic>? data});

  Future<dynamic> delete<T>(String path);
}
