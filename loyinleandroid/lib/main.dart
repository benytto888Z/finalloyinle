import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loyinle/routes/app_pages.dart';




void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await initPreAppServices();
   //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    runApp(
      Phoenix(
        child: const MyApp(),
      ),
    );
  } catch (err) {
    print('Error in main: $err');
  }
}

Future<void> initPreAppServices() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  await GetStorage.init();
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(Buil                   initialRoute: _handleAppInitialRoute(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en', 'US'),
            //fallbackLocale: const Locale('fr', 'FR'),
          ),
    );

  }
  _handleAppInitialRoute() {
   // return AppRoutes.gameScreen;
   //  return AppRoutes.dashboardScreen;
     return AppRoutes.splashscreen;
  }

}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);