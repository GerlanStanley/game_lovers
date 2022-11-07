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
        Provider<SharedPreferences>.value(value: sharedPreferences),
        Provider<LocalDatabase>.value(value: localDatabase),
        Provider<Dio>(create: (_) => Dio()),
        Provider<Interceptor>(
          create: (context) => CustomInterceptor(
            context.read<Dio>(),
            context.read<SharedPreferences>(),
          ),
        ),
        Provider<IHttpHelper>(
          create: (context) => DioHttpHelperImpl(
            context.read<Dio>(),
            context.read<Interceptor>(),
          ),
        ),

        // DataSources
        Provider<ILocalIsDarkDataSource>(
          create: (context) => LocalIsDarkDataSourceImpl(
            context.read<SharedPreferences>(),
          ),
        ),
        Provider<IRemotePlatformDataSource>(
          create: (context) => RemotePlatformDataSourceImpl(
            context.read<IHttpHelper>(),
          ),
        ),
        Provider<ILocalPlatformDataSource>(
          create: (context) => LocalPlatformDataSourceImpl(
            context.read<LocalDatabase>(),
          ),
        ),
        Provider<IRemoteGameDataSource>(
          create: (context) => RemoteGameDataSourceImpl(
            context.read<IHttpHelper>(),
          ),
        ),
        Provider<ILocalGameDataSource>(
          create: (context) => LocalGameDataSourceImpl(
            context.read<LocalDatabase>(),
          ),
        ),
        // Drivers
        Provider<IInternetDriver>(
          create: (context) => InternetDriverImpl(
            context.read<InternetConnectionChecker>(),
          ),
        ),

        // Repositories
        Provider<IIsDarkRepository>(
          create: (context) => IsDarkRepositoryImpl(
            context.read<ILocalIsDarkDataSource>(),
          ),
        ),
        Provider<IPlatformRepository>(
          create: (context) => PlatformRepositoryImpl(
            context.read<IRemotePlatformDataSource>(),
            context.read<ILocalPlatformDataSource>(),
            context.read<IInternetDriver>(),
          ),
        ),
        Provider<IGameRepository>(
          create: (context) => GameRepositoryImpl(
            context.read<IRemoteGameDataSource>(),
            context.read<ILocalGameDataSource>(),
            context.read<IInternetDriver>(),
          ),
        ),

        // UseCases
        Provider<IGetIsDarkUseCase>(
          create: (context) => GetIsDarkUseCaseImpl(
            context.read<IIsDarkRepository>(),
          ),
        ),
        Provider<ISaveIsDarkUseCase>(
          create: (context) => SaveIsDarkUseCaseImpl(
            context.read<IIsDarkRepository>(),
          ),
        ),
        Provider<IGetAllPlatformsUseCase>(
          create: (context) => GetAllPlatformsUseCaseImpl(
            context.read<IPlatformRepository>(),
          ),
        ),
        Provider<IGetAllGamesUseCase>(
          create: (context) => GetAllGamesUseCaseImpl(
            context.read<IGameRepository>(),
          ),
        ),

        // Blocs
        Provider<ThemeBloc>(
          create: (context) => ThemeBloc(
            context.read<IGetIsDarkUseCase>(),
            context.read<ISaveIsDarkUseCase>(),
          )..add(
              InitialThemeEvent(),
            ),
        ),
        Provider<PlatformsBloc>(
          create: (context) => PlatformsBloc(
            context.read<IGetAllPlatformsUseCase>(),
          ),
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
