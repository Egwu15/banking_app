import 'package:banking_app/src/auth/controllers/auth_controller.dart';
import 'package:banking_app/src/auth/views/login.view.dart';
import 'package:banking_app/src/common/widgets/phone_field.dart';
import 'package:banking_app/src/config/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            Image.asset(Strings.registerImage),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.09),
              child: Form(
                key: _formkey,
                child: Obx(
                  () => Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Register",
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
                        child: ElevatedButton(
                            onPressed: () {
                              authController.register(
                                  password: password,
                                  phoneNumber: "$countryCode$number");
                            },
                            child: authController.isLoading.value
                                ? const CircularProgressIndicator.adaptive(
                                    backgroundColor: Colors.white,
                                  )
                                : const Text("Register")),
                      ),
                      const SizedBox(height: 15),
                      RichText(
                        text: TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(color: Colors.grey.shade600),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (() => Get.to(
                                        () => const Login(),
                                      )),
                                text: ' Login',
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
