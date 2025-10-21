import 'package:ecommerce_app/app/core/constants/app_constants.dart';

class ApiEndpoints {
  static const String baseUrl = AppConstants.baseUrl;
  
  // Auth endpoints
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String logout = '$baseUrl/logout';
  static const String userProfile = '$baseUrl/user';
  
  // Product endpoints
  static const String products = '$baseUrl/products';
  static const String categories = '$baseUrl/categories';
  static const String productDetail = '$baseUrl/products/';
  
  // Cart endpoints
  static const String cart = '$baseUrl/cart';
  static const String addToCart = '$baseUrl/cart/add';
  static const String updateCart = '$baseUrl/cart/update';
  static const String removeFromCart = '$baseUrl/cart/remove';
  
  // Order endpoints
  static const String orders = '$baseUrl/orders';
  static const String checkout = '$baseUrl/checkout';
}