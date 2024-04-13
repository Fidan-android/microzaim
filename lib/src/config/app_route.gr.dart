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
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../presentation/init_page.dart' as _i1;

class NavigationRouter extends _i2.RootStackRouter {
  NavigationRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    InitRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.InitPage(),
      );
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          InitRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [_i1.InitPage]
class InitRoute extends _i2.PageRouteInfo<void> {
  const InitRoute()
      : super(
          InitRoute.name,
          path: '/',
        );

  static const String name = 'InitRoute';
}
