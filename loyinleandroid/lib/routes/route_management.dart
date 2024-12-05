import 'package:get/get.dart';
import 'package:loyinle/routes/app_pages.dart';


abstract class RouteManagement {


  static void goToSplashView() {
    Get.offAllNamed(AppRoutes.splashscreen);
  }

  static void goToGameView() {
    Get.offAllNamed(AppRoutes.gameScreen);
  }

  static void goToDashBoardView() {
    Get.offAllNamed(AppRoutes.dashboardScreen);
  }

  /// Go to back Page / Close Pages --------------------------------------------

  static void goToBack() {
    Get.back();
  }
}