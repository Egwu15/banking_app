import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../styles/colors.dart';

custormSnackbar(String message) {
  return Get.snackbar("title", "User already exists",
      titleText: Container(),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      margin: const EdgeInsets.only(bottom: 20.0),
      messageText: Text(message,
          style: Theme.of(Get.context!).textTheme.headline3),
      backgroundColor: CustomColors.deepBlue);
}
