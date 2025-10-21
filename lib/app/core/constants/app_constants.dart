class AppConstants {
  static const String appName = 'E-Commerce App';
  static const String appVersion = '1.0.0';
  
  static const String baseUrl = 'http://your-laravel-backend.com/api';
  // For testing, use: http://10.0.2.2:8000/api (Android emulator)
  // or your actual Laravel API URL
  
  static const String storageTokenKey = 'token';
  static const String storageUserKey = 'user';
  
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}