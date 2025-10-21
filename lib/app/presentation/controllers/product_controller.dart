import 'package:ecommerce_app/app/data/repositories/category_repository.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../data/models/category_model.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/providers/api_provider.dart';

class ProductController extends GetxController {
  final ProductRepository _productRepository = ProductRepository(ApiProvider());
  final CategoryRepository _categoryRepository = CategoryRepository(ApiProvider());

  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxList<ProductModel> popularProducts = <ProductModel>[].obs;
  final RxList<ProductModel> specialOffers = <ProductModel>[].obs;
  final RxList<ProductModel> banners = <ProductModel>[].obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

  final Rx<ProductModel?> selectedProduct = Rx<ProductModel?>(null);
  final RxInt selectedCategoryId = 0.obs;

  final RxBool isLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  final RxInt currentPage = 1.obs;
  final RxInt totalPages = 1.obs;
  final RxBool hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  // Load initial data
  Future<void> loadInitialData() async {
    await Future.wait([
      getProducts(),
      getPopularProducts(),
      getSpecialOffers(),
      getBanners(),
      getCategories(),
    ]);
  }

  // Get products with pagination
  Future<void> getProducts({bool loadMore = false}) async {
    try {
      if (loadMore) {
        if (!hasMore.value) return;
        isLoadingMore.value = true;
        currentPage.value++;
      } else {
        isLoading.value = true;
        currentPage.value = 1;
        products.clear();
      }

      final response = await _productRepository.getProducts(
        page: currentPage.value,
        categoryId: selectedCategoryId.value > 0 ? selectedCategoryId.value : null,
      );

      final newProducts = response['products'] as List<ProductModel>;
      products.addAll(newProducts);

      totalPages.value = (response['total'] / response['per_page']).ceil();
      hasMore.value = currentPage.value < totalPages.value;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }
  }

  // Get product by ID
  Future<void> getProductById(int productId) async {
    try {
      isLoading.value = true;
      selectedProduct.value = await _productRepository.getProductById(productId);
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

  // Get popular products
  Future<void> getPopularProducts() async {
    try {
      popularProducts.value = await _productRepository.getPopularProducts();
    } catch (e) {
      print('Error loading popular products: $e');
    }
  }

  // Get special offers
  Future<void> getSpecialOffers() async {
    try {
      specialOffers.value = await _productRepository.getSpecialOffers();
    } catch (e) {
      print('Error loading special offers: $e');
    }
  }

  // Get banners
  Future<void> getBanners() async {
    try {
      banners.value = await _productRepository.getBanners();
    } catch (e) {
      print('Error loading banners: $e');
    }
  }

  // Get categories
  Future<void> getCategories() async {
    try {
      categories.value = await _categoryRepository.getCategories();
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  // Filter by category
  void filterByCategory(int categoryId) {
    selectedCategoryId.value = categoryId;
    getProducts();
  }

  // Clear category filter
  void clearCategoryFilter() {
    selectedCategoryId.value = 0;
    getProducts();
  }

  // Refresh products
  Future<void> refreshProducts() async {
    await getProducts();
  }
}