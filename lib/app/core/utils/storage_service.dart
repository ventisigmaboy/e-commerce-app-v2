import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _box = GetStorage();
  
  // Keys
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';
  static const String _isLoggedInKey = 'is_logged_in';
  
  // Initialize storage
  static Future<void> init() async {
    await GetStorage.init();
  }
  
  // Token operations
  static Future<void> saveToken(String token) async {
    await _box.write(_tokenKey, token);
  }
  
  static String? getToken() {
    return _box.read(_tokenKey);
  }
  
  static Future<void> removeToken() async {
    await _box.remove(_tokenKey);
  }
  
  // User data operations
  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    await _box.write(_userKey, userData);
  }
  
  static Map<String, dynamic>? getUserData() {
    return _box.read(_userKey);
  }
  
  static Future<void> removeUserData() async {
    await _box.remove(_userKey);
  }
  
  // Login status
  static Future<void> setLoggedIn(bool value) async {
    await _box.write(_isLoggedInKey, value);
  }
  
  static bool isLoggedIn() {
    return _box.read(_isLoggedInKey) ?? false;
  }
  
  // Clear all data
  static Future<void> clearAll() async {
    await _box.erase();
  }
  
  // Check if token exists
  static bool hasToken() {
    return getToken() != null && getToken()!.isNotEmpty;
  }
}