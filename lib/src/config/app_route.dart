import 'package:auto_route/auto_route.dart';
import 'package:microzaim/src/presentation/home.page.dart';
import 'package:microzaim/src/presentation/welcome/welcome.dart';

import '../presentation/init_page.dart';
import 'app_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitPage, initial: true),
    AutoRoute(page: WelcomePage),
    AutoRoute(page: HomePage),
  ],
)
class $NavigationRouter {}

final appRouter = NavigationRouter();
