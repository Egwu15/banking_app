import 'package:banking_app/src/common/widgets/custom_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

void checkResponse(Response response) {
  if (response.statusCode >= 200 && response.statusCode < 300) {
    // Get.to
     debugPrint(response.body);
  } else if (response.statusCode < 200 || response.statusCode > 299) {
    debugPrint(response.body);
    custormSnackbar("User already exists");
  }
}
