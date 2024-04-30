import 'package:auto_route/auto_route.dart';
import 'package:microzaim/src/presentation/article/article_for_kazakhstan_page.dart';
import 'package:microzaim/src/presentation/article/article_for_russia_page.dart';
import 'package:microzaim/src/presentation/article/article_page.dart';
import 'package:microzaim/src/presentation/calculations/debt_info_page.dart';
import 'package:microzaim/src/presentation/calculations/loan_info_page.dart';
import 'package:microzaim/src/presentation/debt_burden/debt_burden_page.dart';
import 'package:microzaim/src/presentation/home.page.dart';
import 'package:microzaim/src/presentation/loan/loan_page.dart';
import 'package:microzaim/src/presentation/sub/sub_page.dart';
import 'package:microzaim/src/presentation/welcome/welcome.dart';

import '../presentation/init_page.dart';
import 'app_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitPage, initial: true),
    AutoRoute(page: WelcomePage),
    AutoRoute(page: HomePage),
    AutoRoute(page: ArticleForRussiaPage),
    AutoRoute(page: ArticleForKazakhstanPage),
    AutoRoute(page: ArticlePage),
    AutoRoute(page: SubPage),
    AutoRoute(page: LoanPage),
    AutoRoute(page: DebtBurdenPage),
    AutoRoute(page: LoanInfoPage),
    AutoRoute(page: DebtInfoPage),
  ],
)
class $NavigationRouter {}

final appRouter = NavigationRouter();
