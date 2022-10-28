import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/domain/repositories/repositories.dart';
import 'app/domain/use_cases/use_cases.dart';
import 'app/external/data_sources/data_sources.dart';
import 'app/infra/data_sources/data_sources.dart';
import 'app/infra/repositories/repositories.dart';
import 'app/presenter/blocs/platforms/platforms.dart';
import 'app/presenter/pages/home/home.dart';
import 'core/constants/constants.dart';
import 'core/helpers/http/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SharedPreferences>(create: (_) => sharedPreferences),
        Provider<Dio>(create: (_) => Dio()),
        Provider<Interceptor>(
          create: (context) => CustomInterceptor(
            context.read(),
            context.read(),
          ),
        ),
        Provider<IHttpHelper>(
          create: (context) => DioHttpHelperImpl(
            context.read(),
            context.read(),
          ),
        ),

        // DataSources
        Provider<IPlatformDataSource>(
          create: (context) => PlatformDataSourceImpl(context.read()),
        ),

        // Repositories
        Provider<IPlatformRepository>(
          create: (context) => PlatformRepositoryImpl(context.read()),
        ),

        // UseCases
        Provider<IGetAllPlatformsUseCase>(
          create: (context) => GetAllPlatformsUseCaseImpl(context.read()),
        ),

        // Blocs
        Provider<PlatformsBloc>(
          create: (context) => PlatformsBloc(context.read()),
        ),
      ],
      child: MaterialApp(
        title: "Game Lovers App",
        theme: ThemeConstants.light,
        home: const HomePage(),
      ),
    );
  }
}
