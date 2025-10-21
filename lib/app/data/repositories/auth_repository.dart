import '../providers/api_provider.dart';
import '../models/user_model.dart';
import '../../core/constants/api_constants.dart';

class AuthRepository {
  final ApiProvider _apiProvider;

  AuthRepository(this._apiProvider);

  // Register
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _apiProvider.post(
        ApiConstants.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Login
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiProvider.post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _apiProvider.post(ApiConstants.logout);
    } catch (e) {
      rethrow;
    }
  }

  // Get User Profile
  Future<UserModel> getUserProfile() async {
    try {
      final response = await _apiProvider.get(ApiConstants.userProfile);
      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      rethrow;
    }
  }

  // Update User Profile
  Future<UserModel> updateUserProfile({
    required String name,
    required String email,
  }) async {
    try {
      final response = await _apiProvider.put(
        ApiConstants.userProfile,
        data: {
          'name': name,
          'email': email,
        },
      );
      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      rethrow;
    }
  }
}