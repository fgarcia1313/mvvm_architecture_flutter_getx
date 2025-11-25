import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/user_service.dart';
import 'viewmodels/user_viewmodel.dart';
import 'views/user_page.dart';

void main() {
  // 1. Registrar las dependencias ANTES de correr la app
  Get.put(UserService());
  Get.put(UserViewModel(Get.find<UserService>()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM + GetX Example',
      home: const UserPage(),
    );
  }
}
