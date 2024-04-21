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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../presentation/article/article_for_kazakhstan_page.dart' as _i5;
import '../presentation/article/article_for_russia_page.dart' as _i4;
import '../presentation/article/article_page.dart' as _i6;
import '../presentation/home.page.dart' as _i3;
import '../presentation/init_page.dart' as _i1;
import '../presentation/sub/sub_page.dart' as _i7;
import '../presentation/welcome/welcome.dart' as _i2;

class NavigationRouter extends _i8.RootStackRouter {
  NavigationRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    InitRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.InitPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    ArticleForRussiaRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ArticleForRussiaPage(),
      );
    },
    ArticleForKazakhstanRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ArticleForKazakhstanPage(),
      );
    },
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ArticlePage(
          key: args.key,
          numberOfArticle: args.numberOfArticle,
        ),
      );
    },
    SubRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.SubPage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          InitRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          WelcomeRoute.name,
          path: '/welcome-page',
        ),
        _i8.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i8.RouteConfig(
          ArticleForRussiaRoute.name,
          path: '/article-for-russia-page',
        ),
        _i8.RouteConfig(
          ArticleForKazakhstanRoute.name,
          path: '/article-for-kazakhstan-page',
        ),
        _i8.RouteConfig(
          ArticleRoute.name,
          path: '/article-page',
        ),
        _i8.RouteConfig(
          SubRoute.name,
          path: '/sub-page',
        ),
      ];
}

/// generated route for
/// [_i1.InitPage]
class InitRoute extends _i8.PageRouteInfo<void> {
  const InitRoute()
      : super(
          InitRoute.name,
          path: '/',
        );

  static const String name = 'InitRoute';
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomeRoute extends _i8.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ArticleForRussiaPage]
class ArticleForRussiaRoute extends _i8.PageRouteInfo<void> {
  const ArticleForRussiaRoute()
      : super(
          ArticleForRussiaRoute.name,
          path: '/article-for-russia-page',
        );

  static const String name = 'ArticleForRussiaRoute';
}

/// generated route for
/// [_i5.ArticleForKazakhstanPage]
class ArticleForKazakhstanRoute extends _i8.PageRouteInfo<void> {
  const ArticleForKazakhstanRoute()
      : super(
          ArticleForKazakhstanRoute.name,
          path: '/article-for-kazakhstan-page',
        );

  static const String name = 'ArticleForKazakhstanRoute';
}

/// generated route for
/// [_i6.ArticlePage]
class ArticleRoute extends _i8.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    _i9.Key? key,
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

  final _i9.Key? key;

  final int numberOfArticle;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, numberOfArticle: $numberOfArticle}';
  }
}

/// generated route for
/// [_i7.SubPage]
class SubRoute extends _i8.PageRouteInfo<void> {
  const SubRoute()
      : super(
          SubRoute.name,
          path: '/sub-page',
        );

  static const String name = 'SubRoute';
}
