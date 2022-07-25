import 'package:banking_app/src/auth/views/register.view.dart';
import 'package:banking_app/src/common/widgets/phone_field.dart';
import 'package:banking_app/src/config/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

import '../controllers/auth_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  String number = '';
  String countryCode = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(Strings.loginImage),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.09),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline1,
                        )),
                    const SizedBox(height: 30),
                    PhoneField(
                       onCountryChanged: (value) => countryCode = value.dialCode!,
                        onNumberChanged: (value) => number = value,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                      onChanged: ((value) => password = value),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: () {
                            authController.login(
                                password: password,
                                phoneNumber: "$countryCode$number");
                          },
                          child: authController.isLoading.value
                              ? const CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.white,
                                )
                              : const Text("Login"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                          text: 'New to banking app?',
                          style: TextStyle(color: Colors.grey.shade600),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(
                                      () => const Register(),
                                    ),
                              text: ' Register',
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
