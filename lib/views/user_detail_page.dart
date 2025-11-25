import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodels/user_viewmodel.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<UserViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('User Detail')),
      body: Obx(() {
        // ---------------------------------
        // 🔵 LOADING
        // ---------------------------------
        if (vm.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // ---------------------------------
        // 🔴 ERROR
        // ---------------------------------
        if (vm.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              vm.errorMessage.value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        final user = vm.selectedUser.value;

        // ---------------------------------
        // ⚪ SIN USUARIO SELECCIONADO
        // ---------------------------------
        if (user == null) {
          return const Center(child: Text("No user selected"));
        }

        // ---------------------------------
        // 🟢 DETALLE DE USUARIO
        // ---------------------------------
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${user.id}', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 10),

              Text('Name: ${user.name}',
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 10),

              Text('Email: ${user.email}',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),

              Text('Website: ${user.website}',
                  style: const TextStyle(fontSize: 18)),
            ],
          ),
        );
      }),
    );
  }
}
