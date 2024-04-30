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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../data/models/debt/debt_model.dart' as _i15;
import '../data/models/loan/loan_model.dart' as _i14;
import '../presentation/article/article_for_kazakhstan_page.dart' as _i5;
import '../presentation/article/article_for_russia_page.dart' as _i4;
import '../presentation/article/article_page.dart' as _i6;
import '../presentation/calculations/debt_info_page.dart' as _i11;
import '../presentation/calculations/loan_info_page.dart' as _i10;
import '../presentation/debt_burden/debt_burden_page.dart' as _i9;
import '../presentation/home.page.dart' as _i3;
import '../presentation/init_page.dart' as _i1;
import '../presentation/loan/loan_page.dart' as _i8;
import '../presentation/sub/sub_page.dart' as _i7;
import '../presentation/welcome/welcome.dart' as _i2;

class NavigationRouter extends _i12.RootStackRouter {
  NavigationRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    InitRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.InitPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    ArticleForRussiaRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ArticleForRussiaPage(),
      );
    },
    ArticleForKazakhstanRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ArticleForKazakhstanPage(),
      );
    },
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ArticlePage(
          key: args.key,
          numberOfArticle: args.numberOfArticle,
        ),
      );
    },
    SubRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.SubPage(),
      );
    },
    LoanRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.LoanPage(),
      );
    },
    DebtBurdenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.DebtBurdenPage(),
      );
    },
    LoanInfoRoute.name: (routeData) {
      final args = routeData.argsAs<LoanInfoRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.LoanInfoPage(
          key: args.key,
          loanModel: args.loanModel,
        ),
      );
    },
    DebtInfoRoute.name: (routeData) {
      final args = routeData.argsAs<DebtInfoRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.DebtInfoPage(
          key: args.key,
          index: args.index,
          debtModel: args.debtModel,
        ),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          InitRoute.name,
          path: '/',
        ),
        _i12.RouteConfig(
          WelcomeRoute.name,
          path: '/welcome-page',
        ),
        _i12.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i12.RouteConfig(
          ArticleForRussiaRoute.name,
          path: '/article-for-russia-page',
        ),
        _i12.RouteConfig(
          ArticleForKazakhstanRoute.name,
          path: '/article-for-kazakhstan-page',
        ),
        _i12.RouteConfig(
          ArticleRoute.name,
          path: '/article-page',
        ),
        _i12.RouteConfig(
          SubRoute.name,
          path: '/sub-page',
        ),
        _i12.RouteConfig(
          LoanRoute.name,
          path: '/loan-page',
        ),
        _i12.RouteConfig(
          DebtBurdenRoute.name,
          path: '/debt-burden-page',
        ),
        _i12.RouteConfig(
          LoanInfoRoute.name,
          path: '/loan-info-page',
        ),
        _i12.RouteConfig(
          DebtInfoRoute.name,
          path: '/debt-info-page',
        ),
      ];
}

/// generated route for
/// [_i1.InitPage]
class InitRoute extends _i12.PageRouteInfo<void> {
  const InitRoute()
      : super(
          InitRoute.name,
          path: '/',
        );

  static const String name = 'InitRoute';
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomeRoute extends _i12.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ArticleForRussiaPage]
class ArticleForRussiaRoute extends _i12.PageRouteInfo<void> {
  const ArticleForRussiaRoute()
      : super(
          ArticleForRussiaRoute.name,
          path: '/article-for-russia-page',
        );

  static const String name = 'ArticleForRussiaRoute';
}

/// generated route for
/// [_i5.ArticleForKazakhstanPage]
class ArticleForKazakhstanRoute extends _i12.PageRouteInfo<void> {
  const ArticleForKazakhstanRoute()
      : super(
          ArticleForKazakhstanRoute.name,
          path: '/article-for-kazakhstan-page',
        );

  static const String name = 'ArticleForKazakhstanRoute';
}

/// generated route for
/// [_i6.ArticlePage]
class ArticleRoute extends _i12.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    _i13.Key? key,
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

  final _i13.Key? key;

  final int numberOfArticle;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, numberOfArticle: $numberOfArticle}';
  }
}

/// generated route for
/// [_i7.SubPage]
class SubRoute extends _i12.PageRouteInfo<void> {
  const SubRoute()
      : super(
          SubRoute.name,
          path: '/sub-page',
        );

  static const String name = 'SubRoute';
}

/// generated route for
/// [_i8.LoanPage]
class LoanRoute extends _i12.PageRouteInfo<void> {
  const LoanRoute()
      : super(
          LoanRoute.name,
          path: '/loan-page',
        );

  static const String name = 'LoanRoute';
}

/// generated route for
/// [_i9.DebtBurdenPage]
class DebtBurdenRoute extends _i12.PageRouteInfo<void> {
  const DebtBurdenRoute()
      : super(
          DebtBurdenRoute.name,
          path: '/debt-burden-page',
        );

  static const String name = 'DebtBurdenRoute';
}

/// generated route for
/// [_i10.LoanInfoPage]
class LoanInfoRoute extends _i12.PageRouteInfo<LoanInfoRouteArgs> {
  LoanInfoRoute({
    _i13.Key? key,
    required _i14.LoanModel loanModel,
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

  final _i13.Key? key;

  final _i14.LoanModel loanModel;

  @override
  String toString() {
    return 'LoanInfoRouteArgs{key: $key, loanModel: $loanModel}';
  }
}

/// generated route for
/// [_i11.DebtInfoPage]
class DebtInfoRoute extends _i12.PageRouteInfo<DebtInfoRouteArgs> {
  DebtInfoRoute({
    _i13.Key? key,
    required int index,
    required _i15.DebtModel debtModel,
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

  final _i13.Key? key;

  final int index;

  final _i15.DebtModel debtModel;

  @override
  String toString() {
    return 'DebtInfoRouteArgs{key: $key, index: $index, debtModel: $debtModel}';
  }
}
