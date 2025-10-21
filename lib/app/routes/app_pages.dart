import 'package:get/get.dart';
import 'app_routes.dart';
import '../presentation/pages/main/main_screen.dart';
import '../presentation/controllers/product_controller.dart';
import '../presentation/controllers/cart_controller.dart';
import '../presentation/controllers/order_controller.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.main;

  static final routes = [
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ProductController());
        Get.lazyPut(() => CartController());
        Get.lazyPut(() => OrderController());
      }),
    ),
  ];
}
