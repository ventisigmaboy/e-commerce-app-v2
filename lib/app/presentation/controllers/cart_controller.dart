import 'package:get/get.dart';
import '../../data/models/cart_model.dart';
import '../../data/repositories/cart_repository.dart';
import '../../data/providers/api_provider.dart';

class CartController extends GetxController {
  final CartRepository _cartRepository = CartRepository(ApiProvider());

  final Rx<CartModel?> cart = Rx<CartModel?>(null);
  final RxBool isLoading = false.obs;
  final RxInt cartItemCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCart();
  }

  // Get cart
  Future<void> getCart() async {
    try {
      isLoading.value = true;
      cart.value = await _cartRepository.getCart();
      cartItemCount.value = cart.value?.totalQuantity ?? 0;
    } catch (e) {
      print('Error loading cart: $e');
      // Don't show error for empty cart
    } finally {
      isLoading.value = false;
    }
  }

  // Add to cart
  Future<void> addToCart({
    required int productId,
    required int quantity,
  }) async {
    try {
      isLoading.value = true;
      final response = await _cartRepository.addToCart(
        productId: productId,
        quantity: quantity,
      );

      cart.value = response['cart'];
      cartItemCount.value = cart.value?.totalQuantity ?? 0;

      Get.snackbar(
        'Success',
        response['message'] ?? 'Item added to cart',
        snackPosition: SnackPosition.BOTTOM,
      );
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

  // Update cart item
  Future<void> updateCartItem({
    required int itemId,
    required int quantity,
  }) async {
    try {
      isLoading.value = true;
      final response = await _cartRepository.updateCartItem(
        itemId: itemId,
        quantity: quantity,
      );

      cart.value = response['cart'];
      cartItemCount.value = cart.value?.totalQuantity ?? 0;

      Get.snackbar(
        'Success',
        'Cart updated',
        snackPosition: SnackPosition.BOTTOM,
      );
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

  // Remove from cart
  Future<void> removeFromCart(int itemId) async {
    try {
      isLoading.value = true;
      final response = await _cartRepository.removeFromCart(itemId);

      cart.value = response['cart'];
      cartItemCount.value = cart.value?.totalQuantity ?? 0;

      Get.snackbar(
        'Success',
        'Item removed from cart',
        snackPosition: SnackPosition.BOTTOM,
      );
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

  // Clear cart
  Future<void> clearCart() async {
    try {
      isLoading.value = true;
      await _cartRepository.clearCart();

      cart.value = null;
      cartItemCount.value = 0;

      Get.snackbar(
        'Success',
        'Cart cleared',
        snackPosition: SnackPosition.BOTTOM,
      );
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

  // Increase quantity
  Future<void> increaseQuantity(int itemId, int currentQuantity) async {
    await updateCartItem(itemId: itemId, quantity: currentQuantity + 1);
  }

  // Decrease quantity
  Future<void> decreaseQuantity(int itemId, int currentQuantity) async {
    if (currentQuantity > 1) {
      await updateCartItem(itemId: itemId, quantity: currentQuantity - 1);
    } else {
      await removeFromCart(itemId);
    }
  }

  // Get total price
  double get totalPrice {
    return cart.value?.totalAsDouble ?? 0.0;
  }

  // Check if cart is empty
  bool get isEmpty {
    return cart.value == null || cart.value!.items.isEmpty;
  }
}