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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../presentation/article/article_for_kazakhstan_page.dart' as _i5;
import '../presentation/article/article_for_russia_page.dart' as _i4;
import '../presentation/article/article_page.dart' as _i6;
import '../presentation/home.page.dart' as _i3;
import '../presentation/init_page.dart' as _i1;
import '../presentation/loan/loan_page.dart' as _i8;
import '../presentation/sub/sub_page.dart' as _i7;
import '../presentation/welcome/welcome.dart' as _i2;

class NavigationRouter extends _i9.RootStackRouter {
  NavigationRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    InitRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.InitPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    ArticleForRussiaRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ArticleForRussiaPage(),
      );
    },
    ArticleForKazakhstanRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ArticleForKazakhstanPage(),
      );
    },
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ArticlePage(
          key: args.key,
          numberOfArticle: args.numberOfArticle,
        ),
      );
    },
    SubRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.SubPage(),
      );
    },
    LoanRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.LoanPage(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          InitRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          WelcomeRoute.name,
          path: '/welcome-page',
        ),
        _i9.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i9.RouteConfig(
          ArticleForRussiaRoute.name,
          path: '/article-for-russia-page',
        ),
        _i9.RouteConfig(
          ArticleForKazakhstanRoute.name,
          path: '/article-for-kazakhstan-page',
        ),
        _i9.RouteConfig(
          ArticleRoute.name,
          path: '/article-page',
        ),
        _i9.RouteConfig(
          SubRoute.name,
          path: '/sub-page',
        ),
        _i9.RouteConfig(
          LoanRoute.name,
          path: '/loan-page',
        ),
      ];
}

/// generated route for
/// [_i1.InitPage]
class InitRoute extends _i9.PageRouteInfo<void> {
  const InitRoute()
      : super(
          InitRoute.name,
          path: '/',
        );

  static const String name = 'InitRoute';
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomeRoute extends _i9.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ArticleForRussiaPage]
class ArticleForRussiaRoute extends _i9.PageRouteInfo<void> {
  const ArticleForRussiaRoute()
      : super(
          ArticleForRussiaRoute.name,
          path: '/article-for-russia-page',
        );

  static const String name = 'ArticleForRussiaRoute';
}

/// generated route for
/// [_i5.ArticleForKazakhstanPage]
class ArticleForKazakhstanRoute extends _i9.PageRouteInfo<void> {
  const ArticleForKazakhstanRoute()
      : super(
          ArticleForKazakhstanRoute.name,
          path: '/article-for-kazakhstan-page',
        );

  static const String name = 'ArticleForKazakhstanRoute';
}

/// generated route for
/// [_i6.ArticlePage]
class ArticleRoute extends _i9.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    _i10.Key? key,
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

  final _i10.Key? key;

  final int numberOfArticle;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, numberOfArticle: $numberOfArticle}';
  }
}

/// generated route for
/// [_i7.SubPage]
class SubRoute extends _i9.PageRouteInfo<void> {
  const SubRoute()
      : super(
          SubRoute.name,
          path: '/sub-page',
        );

  static const String name = 'SubRoute';
}

/// generated route for
/// [_i8.LoanPage]
class LoanRoute extends _i9.PageRouteInfo<void> {
  const LoanRoute()
      : super(
          LoanRoute.name,
          path: '/loan-page',
        );

  static const String name = 'LoanRoute';
}
