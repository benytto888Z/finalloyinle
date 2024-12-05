part of 'app_pages.dart';

abstract class AppRoutes {
  static const splashscreen = _Routes.splashscreen;
  static const gameScreen = _Routes.gameScreen;
  static const dashboardScreen = _Routes.dashboardScreen;

}

abstract class _Routes {
  static const splashscreen = '/';
  static const gameScreen = '/gameScreen';
  static const dashboardScreen = '/dashboardScreen';

}