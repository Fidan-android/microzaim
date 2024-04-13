import 'package:auto_route/auto_route.dart';

import '../presentation/init_page.dart';
import 'app_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitPage, initial: true),
  ],
)
class $NavigationRouter {}

final appRouter = NavigationRouter();
