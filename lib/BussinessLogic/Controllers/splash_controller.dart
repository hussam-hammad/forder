// ignore_for_file: avoid_print

import 'package:flashorder/Constants/routes.dart';
import 'package:flashorder/Presenttion/Screens/Auth/privacy.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var authed = false;
  final box = GetStorage();

  @override
  void onReady() async {
    await checkAuth();
  }

  /* Future<bool> checkconnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    return true;
  } */

  Future<void> checkAuth() async {
    bool authed = box.read('authed') ?? false;

    if (authed == true) {
      Future.delayed(const Duration(seconds: 6))
          .then((value) => Get.offAndToNamed(AppRoutes.homepage));
    } else {
      Future.delayed(const Duration(seconds: 6))
          .then((value) => Get.to(() => const PrivacyPolicy(
                forAccept: true,
              )));
    }
  }
}
