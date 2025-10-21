import 'package:ecommerce_app/app/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../data/models/order_model.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/providers/api_provider.dart';
import 'cart_controller.dart';

class OrderController extends GetxController {
  final OrderRepository _orderRepository = OrderRepository(ApiProvider());

  final RxList<OrderModel> orders = <OrderModel>[].obs;
  final Rx<OrderModel?> selectedOrder = Rx<OrderModel?>(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  // Get all orders
  Future<void> getOrders() async {
    try {
      isLoading.value = true;
      orders.value = await _orderRepository.getOrders();
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

  // Get order by ID
  Future<void> getOrderById(int orderId) async {
    try {
      isLoading.value = true;
      selectedOrder.value = await _orderRepository.getOrderById(orderId);
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

  // Checkout
  Future<void> checkout({
    required String street,
    required String city,
    required String state,
    required String zip,
    required String country,
    required String customerName,
    required String customerEmail,
  }) async {
    try {
      isLoading.value = true;

      final shippingAddress = {
        'street': street,
        'city': city,
        'state': state,
        'zip': zip,
        'country': country,
      };

      final response = await _orderRepository.checkout(
        shippingAddress: shippingAddress,
        customerName: customerName,
        customerEmail: customerEmail,
      );

      Get.snackbar(
        'Success',
        response['message'] ?? 'Order placed successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Refresh cart and orders
      final cartController = Get.find<CartController>();
      await cartController.getCart();
      await getOrders();

      // Navigate to orders page
      Get.offAllNamed(AppRoutes.orders);
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

  // Refresh orders
  Future<void> refreshOrders() async {
    await getOrders();
  }
}