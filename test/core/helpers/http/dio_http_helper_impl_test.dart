import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers/core/failures/failures.dart';
import 'package:mocktail/mocktail.dart';

import 'package:game_lovers/core/helpers/http/http.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late IHttpHelper httpService;

  setUp(() {
    dio = MockDio();
    when(() => dio.interceptors).thenAnswer((_) => Interceptors());
    when(() => dio.options).thenAnswer((_) => BaseOptions());
    httpService = DioHttpHelperImpl(dio, Interceptor());
  });

  test(
    "Deve lançar um BadRequestHttpFailure quando o código da requisição for 400",
    () {
      when(() => dio.get(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ""),
        response: Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: "path"),
        ),
      ));

      var result = httpService.get("path");

      expect(result, throwsA(isA<BadRequestHttpFailure>()));
    },
  );

  test(
    "Deve lançar um UnauthorizedHttpFailure quando o código da requisição for 401",
    () {
      when(() => dio.get(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ""),
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: "path"),
        ),
      ));

      var result = httpService.get("path");

      expect(result, throwsA(isA<UnauthorizedHttpFailure>()));
    },
  );

  test(
    "Deve lançar um NotFoundHttpFailure quando o código da requisição for 404",
    () {
      when(() => dio.get(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ""),
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: "path"),
        ),
      ));

      var result = httpService.get("path");

      expect(result, throwsA(isA<NotFoundHttpFailure>()));
    },
  );

  test(
    "Deve lançar um ServerHttpFailure quando o código da requisição for 500",
    () {
      when(() => dio.get(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ""),
        response: Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: "path"),
        ),
      ));

      var result = httpService.get("path");

      expect(result, throwsA(isA<ServerHttpFailure>()));
    },
  );

  test(
    "Deve lançar um HttpFailure quando o código não for um códgo não tratável",
    () {
      when(() => dio.get(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ""),
        response: Response(
          statusCode: 600,
          requestOptions: RequestOptions(path: "path"),
        ),
      ));

      var result = httpService.get("path");

      expect(result, throwsA(isA<HttpFailure>()));
    },
  );
}
