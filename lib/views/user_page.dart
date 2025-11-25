import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodels/user_viewmodel.dart';
import 'user_detail_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inyectar o encontrar el ViewModel
    final vm = Get.find<UserViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
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

        // ---------------------------------
        // ⚪ LISTA VACÍA
        // ---------------------------------
        if (vm.users.isEmpty) {
          return const Center(child: Text("No users found"));
        }

        // ---------------------------------
        // 🟢 LISTA DE USUARIOS
        // ---------------------------------
        return ListView.builder(
          itemCount: vm.users.length,
          itemBuilder: (_, index) {
            final user = vm.users[index];

            return ListTile(
              title: Text(user.name),
              subtitle: Text("${user.email} | Website: ${user.website}"),

              onTap: () async {
                await vm.loadUserById(user.id);
                Get.to(() => const UserDetailPage());
              },
            );
          },
        );
      }),
    );
  }
}
