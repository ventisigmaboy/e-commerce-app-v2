import '../providers/api_provider.dart';
import '../models/cart_model.dart';
import '../../core/constants/api_constants.dart';

class CartRepository {
  final ApiProvider _apiProvider;

  CartRepository(this._apiProvider);

  // Get cart
  Future<CartModel> getCart() async {
    try {
      final response = await _apiProvider.get(ApiConstants.cart);
      return CartModel.fromJson(response.data['cart']);
    } catch (e) {
      rethrow;
    }
  }

  // Add item to cart
  Future<Map<String, dynamic>> addToCart({
    required int productId,
    required int quantity,
  }) async {
    try {
      final response = await _apiProvider.post(
        ApiConstants.cartAddItem,
        data: {
          'product_id': productId,
          'quantity': quantity,
        },
      );
      return {
        'message': response.data['message'],
        'cart': CartModel.fromJson(response.data['cart']),
      };
    } catch (e) {
      rethrow;
    }
  }

  // Update cart item
  Future<Map<String, dynamic>> updateCartItem({
    required int itemId,
    required int quantity,
  }) async {
    try {
      final response = await _apiProvider.put(
        ApiConstants.cartUpdateItem(itemId),
        data: {
          'quantity': quantity,
        },
      );
      return {
        'message': response.data['message'],
        'cart': CartModel.fromJson(response.data['cart']),
      };
    } catch (e) {
      rethrow;
    }
  }

  // Remove item from cart
  Future<Map<String, dynamic>> removeFromCart(int itemId) async {
    try {
      final response = await _apiProvider.delete(
        ApiConstants.cartRemoveItem(itemId),
      );
      return {
        'message': response.data['message'],
        'cart': CartModel.fromJson(response.data['cart']),
      };
    } catch (e) {
      rethrow;
    }
  }

  // Clear cart
  Future<void> clearCart() async {
    try {
      await _apiProvider.delete(ApiConstants.cart);
    } catch (e) {
      rethrow;
    }
  }
}