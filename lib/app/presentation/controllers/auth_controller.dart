import 'package:ecommerce_app/app/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/providers/api_provider.dart';
import '../../core/utils/storage_service.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository(ApiProvider());

  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  // Check if user is logged in
  void checkLoginStatus() {
    isLoggedIn.value = StorageService.isLoggedIn();
    if (isLoggedIn.value) {
      final userData = StorageService.getUserData();
      if (userData != null) {
        currentUser.value = UserModel.fromJson(userData);
      }
    }
  }

  // Register
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      isLoading.value = true;
      final response = await _authRepository.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      // Save token and user data
      await StorageService.saveToken(response['token']);
      await StorageService.saveUserData(response['user']);
      await StorageService.setLoggedIn(true);

      currentUser.value = UserModel.fromJson(response['user']);
      isLoggedIn.value = true;

      Get.snackbar(
        'Success',
        response['message'] ?? 'Registration successful',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate to home
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Login
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      final response = await _authRepository.login(
        email: email,
        password: password,
      );

      // Save token and user data
      await StorageService.saveToken(response['token']);
      await StorageService.saveUserData(response['user']);
      await StorageService.setLoggedIn(true);

      currentUser.value = UserModel.fromJson(response['user']);
      isLoggedIn.value = true;

      Get.snackbar(
        'Success',
        response['message'] ?? 'Login successful',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate to home
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      isLoading.value = true;
      await _authRepository.logout();

      // Clear local storage
      await StorageService.clearAll();

      currentUser.value = null;
      isLoggedIn.value = false;

      Get.snackbar(
        'Success',
        'Logged out successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate to login
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Get user profile
  Future<void> getUserProfile() async {
    try {
      isLoading.value = true;
      final user = await _authRepository.getUserProfile();
      currentUser.value = user;
      await StorageService.saveUserData(user.toJson());
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}