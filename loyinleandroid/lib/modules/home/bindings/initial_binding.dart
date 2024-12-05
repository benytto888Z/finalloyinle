import 'package:get/get.dart';
import 'package:loyinle/modules/home/controllers/configs_controller.dart';
import 'package:loyinle/modules/home/controllers/gameui_ctrl.dart';


class InitialBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(GameUiCtrl.new, fenix: true);
     Get.lazyPut(ConfigsController.new, fenix: true);
  }
}
