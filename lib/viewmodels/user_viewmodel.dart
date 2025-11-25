import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserViewModel extends GetxController {
  final UserService userService;

  // ---------------------------
  // 🔵 ESTADO REACTIVO
  // ---------------------------
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var users = <UserModel>[].obs;
  var selectedUser = Rx<UserModel?>(null);

  UserViewModel(this.userService);

  // ---------------------------
  // Ciclo de vida (equivalente a initState / onInit)
  // ---------------------------
  @override
  void onInit() {
    loadUsers(); // se ejecuta automáticamente al iniciar el ViewModel
    super.onInit();
  }

  // ---------------------------
  // 1. Obtener todos los usuarios
  // ---------------------------
  Future<void> loadUsers() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await userService.getAllUsers();
      users.assignAll(result);

    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // ---------------------------
  // 2. Obtener usuario por ID
  // ---------------------------
  Future<void> loadUserById(int id) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await userService.getUserById(id);
      selectedUser.value = result;

    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
