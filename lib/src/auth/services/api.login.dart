import 'package:banking_app/src/auth/services/check_response.dart';
import 'package:banking_app/src/common/widgets/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import '../../config/config.dart';

class AuthService {
  register(phoneNumber, password) async {
    try {
      var url = Uri.parse("${Config.baseUrl}/auth/signup");
      http.Response response = await http
          .post(url, body: {'phoneNumber': phoneNumber, 'password': password});
      checkResponse(response);
    } catch (e) {
      custormSnackbar("Check network settings");
    }
  }

  login(phoneNumber, password) async {
    try {
      var url = Uri.parse("${Config.baseUrl}/auth/login");
      http.Response response = await http
          .post(url, body: {'phoneNumber': phoneNumber, 'password': password});
      checkResponse(response);
    } catch (e) {
      custormSnackbar("Check network settings");
    }
  }
}
