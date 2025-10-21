class ApiConstants {
  // Base URL - Change this to your Laravel backend URL
  static const String baseUrl = 'http://127.0.0.1:8001/api';
  
  // Timeouts
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  
  // Auth Headers
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  
  // Auth Endpoints
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String userProfile = '/auth/user';
  
  // Product Endpoints
  static const String products = '/products';
  static const String popularProducts = '/products/popular';
  static const String specialOffers = '/products/special-offers';
  
  // Category Endpoints
  static const String categories = '/categories';
  
  // Banner Endpoints
  static const String banners = '/banners';
  
  // Cart Endpoints
  static const String cart = '/cart';
  static const String cartAddItem = '/cart/items';
  static String cartUpdateItem(int itemId) => '/cart/items/$itemId';
  static String cartRemoveItem(int itemId) => '/cart/items/$itemId';
  
  // Order Endpoints
  static const String orders = '/orders';
  static String orderDetail(int orderId) => '/orders/$orderId';
  static const String checkout = '/checkout';
  
  // Product Detail
  static String productDetail(int productId) => '/products/$productId';
  
  // Category Detail
  static String categoryDetail(int categoryId) => '/categories/$categoryId';
}