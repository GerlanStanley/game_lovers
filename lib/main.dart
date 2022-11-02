import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/domain/repositories/repositories.dart';
import 'app/domain/use_cases/use_cases.dart';
import 'app/external/data_sources/data_sources.dart';
import 'app/external/drift/database.dart';
import 'app/external/drivers/drivers.dart';
import 'app/infra/data_sources/data_sources.dart';
import 'app/infra/drivers/drivers.dart';
import 'app/infra/repositories/repositories.dart';
import 'app/presenter/blocs/platforms/platforms.dart';
import 'app/presenter/blocs/theme/theme.dart';
import 'app/presenter/pages/home/home.dart';
import 'core/constants/constants.dart';
import 'core/helpers/http/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final localDatabase = LocalDatabase();

  runApp(MyApp(
    sharedPreferences: sharedPreferences,
    localDatabase: localDatabase,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final LocalDatabase localDatabase;

  const MyApp({
    Key? key,
    required this.sharedPreferences,
    required this.localDatabase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<InternetConnectionChecker>(
          create: (_) => InternetConnectionChecker(),
        ),
        Provider<SharedPreferences>(create: (_) => sharedPreferences),
        Provider<LocalDatabase>(create: (_) => localDatabase),
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
        Provider<ILocalIsDarkDataSource>(
          create: (context) => LocalIsDarkDataSourceImpl(context.read()),
        ),
        Provider<IRemotePlatformDataSource>(
          create: (context) => RemotePlatformDataSourceImpl(context.read()),
        ),
        Provider<ILocalPlatformDataSource>(
          create: (context) => LocalPlatformDataSourceImpl(context.read()),
        ),
        Provider<IRemoteGameDataSource>(
          create: (context) => RemoteGameDataSourceImpl(context.read()),
        ),
        Provider<ILocalGameDataSource>(
          create: (context) => LocalGameDataSourceImpl(context.read()),
        ),
        // Drivers
        Provider<IInternetDriver>(
          create: (context) => InternetDriverImpl(context.read()),
        ),

        // Repositories
        Provider<IIsDarkRepository>(
          create: (context) => IsDarkRepositoryImpl(context.read()),
        ),
        Provider<IPlatformRepository>(
          create: (context) => PlatformRepositoryImpl(
            context.read(),
            context.read(),
            context.read(),
          ),
        ),
        Provider<IGameRepository>(
          create: (context) => GameRepositoryImpl(
            context.read(),
            context.read(),
            context.read(),
          ),
        ),

        // UseCases
        Provider<IGetIsDarkUseCase>(
          create: (context) => GetIsDarkUseCaseImpl(context.read()),
        ),
        Provider<ISaveIsDarkUseCase>(
          create: (context) => SaveIsDarkUseCaseImpl(context.read()),
        ),
        Provider<IGetAllPlatformsUseCase>(
          create: (context) => GetAllPlatformsUseCaseImpl(context.read()),
        ),
        Provider<IGetAllGamesUseCase>(
          create: (context) => GetAllGamesUseCaseImpl(context.read()),
        ),

        // Blocs
        Provider<ThemeBloc>(
          create: (context) => ThemeBloc(context.read(), context.read())
            ..add(
              InitialThemeEvent(),
            ),
        ),
        Provider<PlatformsBloc>(
          create: (context) => PlatformsBloc(context.read()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return MaterialApp(
            title: "Game Lovers App",
            theme: state.isDark ? ThemeConstants.dark : ThemeConstants.light,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
