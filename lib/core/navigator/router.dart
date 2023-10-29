import 'package:flutter/material.dart';
import 'package:test_app/core/navigator/route_name.dart';
import 'package:test_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:test_app/features/onboarding/presentation/pages/splash.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splash:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SplashScreen(),
      );
    case RouteName.dashboard:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const DashboardPage(),
      );

    default:
      return MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute<void>(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow!,
  );
}
