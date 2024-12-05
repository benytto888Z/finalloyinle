import 'package:get/get.dart';

import 'package:loyinle/modules/background/dashboard.dart';
import 'package:loyinle/modules/home/bindings/initial_binding.dart';
import 'package:loyinle/modules/home/views/game_area.dart';
import 'package:loyinle/modules/onboarding/splash_screen.dart';

part 'app_routes.dart';

abstract class AppPages {
  static var transitionDuration = const Duration(milliseconds: 1500);
  static var transitionDurationProfil = const Duration(milliseconds: 1000);
  static var defaultTransitionDuration = const Duration(milliseconds: 500);
  static var defaultTransition = Transition.fade;
  static var defaultTransition2 = Transition.circularReveal;
  static var defaultTransitionProfil = Transition.fadeIn;
  static var rightToRightTransition = Transition.rightToLeft;
  static var rightToLeftTransitionFade = Transition.rightToLeftWithFade ;
  static final pages = [


   /* GetPage(
      name: _Routes.splash,
      page: SplashScreen.new,
      transitionDuration: transitionDuration,
      transition: defaultTransition2,
    ),*/


    GetPage(
      name: _Routes.splashscreen,
      page: SplashScreen.new,
      transitionDuration: transitionDuration,
      transition:  defaultTransition2,
    ),

    GetPage(
      name: _Routes.dashboardScreen,
      page: Dashboard.new,
      transitionDuration: transitionDuration,
      transition:  defaultTransition2,
    ),
    GetPage(
      name: _Routes.gameScreen,
      page: GameScreen.new,
      binding: InitialBinding(),
      transitionDuration: transitionDuration,
      transition:  defaultTransition2,
    ),

  ];
}
