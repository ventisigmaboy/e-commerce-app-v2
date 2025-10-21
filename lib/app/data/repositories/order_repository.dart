import '../providers/api_provider.dart';
import '../models/order_model.dart';
import '../../core/constants/api_constants.dart';

class OrderRepository {
  final ApiProvider _apiProvider;

  OrderRepository(this._apiProvider);

  // Get all orders
  Future<List<OrderModel>> getOrders() async {
    try {
      final response = await _apiProvider.get(ApiConstants.orders);
      return (response.data['orders'] as List)
          .map((order) => OrderModel.fromJson(order))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // Get single order
  Future<OrderModel> getOrderById(int orderId) async {
    try {
      final response = await _apiProvider.get(
        ApiConstants.orderDetail(orderId),
      );
      return OrderModel.fromJson(response.data['order']);
    } catch (e) {
      rethrow;
    }
  }

  // Checkout - Create order from cart
  Future<Map<String, dynamic>> checkout({
    required Map<String, dynamic> shippingAddress,
    required String customerName,
    required String customerEmail,
  }) async {
    try {
      final response = await _apiProvider.post(
        ApiConstants.checkout,
        data: {
          'shipping_address': shippingAddress,
          'customer_name': customerName,
          'customer_email': customerEmail,
        },
      );
      return {
        'message': response.data['message'],
        'order': OrderModel.fromJson(response.data['order']),
      };
    } catch (e) {
      rethrow;
    }
  }
}