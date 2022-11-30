import 'package:get/get.dart';
import './Login_controller.dart';

class LoginBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(LoginController());
    }
}