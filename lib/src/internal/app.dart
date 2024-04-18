import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:microzaim/src/domain/state/home/home_state.dart';
import 'package:microzaim/src/domain/state/init/init_state.dart';
import 'package:microzaim/src/domain/state/theme/theme_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_route.dart';
import '../config/navigation_service.dart';
import '../data/repository/storage_repository.dart';
import '../data/repository/theme_repository.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<Application> {
  late Future<SharedPreferences> _sharedPreferences;

  @override
  void initState() {
    _sharedPreferences = SharedPreferences.getInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _sharedPreferences,
      builder: (context, snapshot) {
        debugPrint(snapshot.toString());
        if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              Provider<SharedPreferences>(create: (context) => snapshot.data!),
              Provider(
                create: (context) => StorageRepository(
                  Provider.of<SharedPreferences>(context, listen: false),
                ),
              ),
              Provider(
                create: (_) => ThemeState(ThemeRepository())..getTheme(),
              ),
              Provider(
                create: (context) => InitState(
                  Provider.of<StorageRepository>(context, listen: false),
                ),
              ),
              Provider(
                create: (context) => HomeState(
                  Provider.of<StorageRepository>(context, listen: false),
                ),
              ),
            ],
            child: Consumer<ThemeState>(
              builder: (_, ThemeState value, __) => Observer(
                builder: (_) => MaterialApp.router(
                  theme: value.theme,
                  scaffoldMessengerKey: NavigationService.navigatorKey,
                  routerDelegate: AutoRouterDelegate(appRouter),
                  routeInformationParser: appRouter.defaultRouteParser(),
                  debugShowCheckedModeBanner: false,
                ),
              ),
            ),
          );
        } else {
          return Provider(
            create: (_) => ThemeState(ThemeRepository())..getTheme(),
            child: Consumer<ThemeState>(
              builder: (_, ThemeState value, __) => Observer(
                builder: (_) => MaterialApp(
                  theme: value.theme,
                  builder: (context, widget) => const Scaffold(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
