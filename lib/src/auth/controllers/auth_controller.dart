import 'package:banking_app/src/auth/services/api.login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthService authService = AuthService();
  RxBool isLoading = false.obs;

  register({required String phoneNumber, required String password}) async {
    isLoading.value = true;
    debugPrint(password);
    debugPrint(phoneNumber);
    await authService.register(phoneNumber, password);
    isLoading.value = false;
  }

  login({required String phoneNumber, required String password}) async {
    isLoading.value = true;
    await authService.login(phoneNumber, password);
    isLoading.value = false;
  }
}
