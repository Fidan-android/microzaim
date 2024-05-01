// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../data/models/debt/debt_model.dart' as _i16;
import '../data/models/loan/loan_model.dart' as _i15;
import '../presentation/article/article_for_kazakhstan_page.dart' as _i5;
import '../presentation/article/article_for_russia_page.dart' as _i4;
import '../presentation/article/article_page.dart' as _i6;
import '../presentation/calculations/debt_info_page.dart' as _i11;
import '../presentation/calculations/loan_info_page.dart' as _i10;
import '../presentation/debt_burden/debt_burden_page.dart' as _i9;
import '../presentation/home.page.dart' as _i3;
import '../presentation/import/import_page.dart' as _i12;
import '../presentation/init_page.dart' as _i1;
import '../presentation/loan/loan_page.dart' as _i8;
import '../presentation/sub/sub_page.dart' as _i7;
import '../presentation/welcome/welcome.dart' as _i2;

class NavigationRouter extends _i13.RootStackRouter {
  NavigationRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    InitRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.InitPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    ArticleForRussiaRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ArticleForRussiaPage(),
      );
    },
    ArticleForKazakhstanRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ArticleForKazakhstanPage(),
      );
    },
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ArticlePage(
          key: args.key,
          numberOfArticle: args.numberOfArticle,
        ),
      );
    },
    SubRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.SubPage(),
      );
    },
    LoanRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.LoanPage(),
      );
    },
    DebtBurdenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.DebtBurdenPage(),
      );
    },
    LoanInfoRoute.name: (routeData) {
      final args = routeData.argsAs<LoanInfoRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.LoanInfoPage(
          key: args.key,
          loanModel: args.loanModel,
        ),
      );
    },
    DebtInfoRoute.name: (routeData) {
      final args = routeData.argsAs<DebtInfoRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.DebtInfoPage(
          key: args.key,
          index: args.index,
          debtModel: args.debtModel,
        ),
      );
    },
    ImportRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ImportPage(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          InitRoute.name,
          path: '/',
        ),
        _i13.RouteConfig(
          WelcomeRoute.name,
          path: '/welcome-page',
        ),
        _i13.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i13.RouteConfig(
          ArticleForRussiaRoute.name,
          path: '/article-for-russia-page',
        ),
        _i13.RouteConfig(
          ArticleForKazakhstanRoute.name,
          path: '/article-for-kazakhstan-page',
        ),
        _i13.RouteConfig(
          ArticleRoute.name,
          path: '/article-page',
        ),
        _i13.RouteConfig(
          SubRoute.name,
          path: '/sub-page',
        ),
        _i13.RouteConfig(
          LoanRoute.name,
          path: '/loan-page',
        ),
        _i13.RouteConfig(
          DebtBurdenRoute.name,
          path: '/debt-burden-page',
        ),
        _i13.RouteConfig(
          LoanInfoRoute.name,
          path: '/loan-info-page',
        ),
        _i13.RouteConfig(
          DebtInfoRoute.name,
          path: '/debt-info-page',
        ),
        _i13.RouteConfig(
          ImportRoute.name,
          path: '/import-page',
        ),
      ];
}

/// generated route for
/// [_i1.InitPage]
class InitRoute extends _i13.PageRouteInfo<void> {
  const InitRoute()
      : super(
          InitRoute.name,
          path: '/',
        );

  static const String name = 'InitRoute';
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomeRoute extends _i13.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ArticleForRussiaPage]
class ArticleForRussiaRoute extends _i13.PageRouteInfo<void> {
  const ArticleForRussiaRoute()
      : super(
          ArticleForRussiaRoute.name,
          path: '/article-for-russia-page',
        );

  static const String name = 'ArticleForRussiaRoute';
}

/// generated route for
/// [_i5.ArticleForKazakhstanPage]
class ArticleForKazakhstanRoute extends _i13.PageRouteInfo<void> {
  const ArticleForKazakhstanRoute()
      : super(
          ArticleForKazakhstanRoute.name,
          path: '/article-for-kazakhstan-page',
        );

  static const String name = 'ArticleForKazakhstanRoute';
}

/// generated route for
/// [_i6.ArticlePage]
class ArticleRoute extends _i13.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    _i14.Key? key,
    required int numberOfArticle,
  }) : super(
          ArticleRoute.name,
          path: '/article-page',
          args: ArticleRouteArgs(
            key: key,
            numberOfArticle: numberOfArticle,
          ),
        );

  static const String name = 'ArticleRoute';
}

class ArticleRouteArgs {
  const ArticleRouteArgs({
    this.key,
    required this.numberOfArticle,
  });

  final _i14.Key? key;

  final int numberOfArticle;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, numberOfArticle: $numberOfArticle}';
  }
}

/// generated route for
/// [_i7.SubPage]
class SubRoute extends _i13.PageRouteInfo<void> {
  const SubRoute()
      : super(
          SubRoute.name,
          path: '/sub-page',
        );

  static const String name = 'SubRoute';
}

/// generated route for
/// [_i8.LoanPage]
class LoanRoute extends _i13.PageRouteInfo<void> {
  const LoanRoute()
      : super(
          LoanRoute.name,
          path: '/loan-page',
        );

  static const String name = 'LoanRoute';
}

/// generated route for
/// [_i9.DebtBurdenPage]
class DebtBurdenRoute extends _i13.PageRouteInfo<void> {
  const DebtBurdenRoute()
      : super(
          DebtBurdenRoute.name,
          path: '/debt-burden-page',
        );

  static const String name = 'DebtBurdenRoute';
}

/// generated route for
/// [_i10.LoanInfoPage]
class LoanInfoRoute extends _i13.PageRouteInfo<LoanInfoRouteArgs> {
  LoanInfoRoute({
    _i14.Key? key,
    required _i15.LoanModel loanModel,
  }) : super(
          LoanInfoRoute.name,
          path: '/loan-info-page',
          args: LoanInfoRouteArgs(
            key: key,
            loanModel: loanModel,
          ),
        );

  static const String name = 'LoanInfoRoute';
}

class LoanInfoRouteArgs {
  const LoanInfoRouteArgs({
    this.key,
    required this.loanModel,
  });

  final _i14.Key? key;

  final _i15.LoanModel loanModel;

  @override
  String toString() {
    return 'LoanInfoRouteArgs{key: $key, loanModel: $loanModel}';
  }
}

/// generated route for
/// [_i11.DebtInfoPage]
class DebtInfoRoute extends _i13.PageRouteInfo<DebtInfoRouteArgs> {
  DebtInfoRoute({
    _i14.Key? key,
    required int index,
    required _i16.DebtModel debtModel,
  }) : super(
          DebtInfoRoute.name,
          path: '/debt-info-page',
          args: DebtInfoRouteArgs(
            key: key,
            index: index,
            debtModel: debtModel,
          ),
        );

  static const String name = 'DebtInfoRoute';
}

class DebtInfoRouteArgs {
  const DebtInfoRouteArgs({
    this.key,
    required this.index,
    required this.debtModel,
  });

  final _i14.Key? key;

  final int index;

  final _i16.DebtModel debtModel;

  @override
  String toString() {
    return 'DebtInfoRouteArgs{key: $key, index: $index, debtModel: $debtModel}';
  }
}

/// generated route for
/// [_i12.ImportPage]
class ImportRoute extends _i13.PageRouteInfo<void> {
  const ImportRoute()
      : super(
          ImportRoute.name,
          path: '/import-page',
        );

  static const String name = 'ImportRoute';
}
