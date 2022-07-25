import 'package:banking_app/src/auth/views/login.view.dart';
import 'package:banking_app/src/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Banking App',
      theme: themeData,
      home: Login(),
    );
  }
}
