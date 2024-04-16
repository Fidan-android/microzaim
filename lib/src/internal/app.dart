import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:microzaim/src/domain/state/init/init_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_route.dart';
import '../config/navigation_service.dart';
import '../data/repository/storage_repository.dart';

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
                create: (context) => InitState(
                  Provider.of<StorageRepository>(context, listen: false),
                ),
              ),
            ],
            child: MaterialApp.router(
              scaffoldMessengerKey: NavigationService.navigatorKey,
              routerDelegate: AutoRouterDelegate(appRouter),
              routeInformationParser: appRouter.defaultRouteParser(),
              debugShowCheckedModeBanner: false,
            ),
          );
        } else {
          return MaterialApp(
            builder: (context, widget) => const Scaffold(),
          );
        }
      },
    );
  }
}
