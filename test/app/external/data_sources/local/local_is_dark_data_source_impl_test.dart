import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:game_lovers/app/external/data_sources/data_sources.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences sharedPreferences;
  LocalIsDarkDataSourceImpl dataSource;
  const String key = "is_dark_key";

  WidgetsFlutterBinding.ensureInitialized();

  group("Get", () {
    test("Deve retornar um false quando não estiver nada armazenado", () async {
      SharedPreferences.setMockInitialValues({});

      sharedPreferences = await SharedPreferences.getInstance();
      dataSource = LocalIsDarkDataSourceImpl(sharedPreferences);

      var result = dataSource.get();
      expect(result, false);
    });

    test("Deve retornar um true quando estiver armazenado true", () async {
      SharedPreferences.setMockInitialValues({key: true});

      sharedPreferences = await SharedPreferences.getInstance();
      dataSource = LocalIsDarkDataSourceImpl(sharedPreferences);

      var result = dataSource.get();
      expect(result, true);
    });
  });

  group("Save", () {
    test(
      "Deve retornar true quando conseguir inserir e "
      "deve está armazenado o mesmo valor passado no save",
      () async {
        sharedPreferences = await SharedPreferences.getInstance();
        dataSource = LocalIsDarkDataSourceImpl(sharedPreferences);

        expect(await dataSource.save(value: true), true);
        expect(dataSource.get(), true);

        expect(await dataSource.save(value: false), true);
        expect(dataSource.get(), false);
      },
    );
  });
}
