import '../providers/api_provider.dart';
import '../models/product_model.dart';
import '../../core/constants/api_constants.dart';

class ProductRepository {
  final ApiProvider _apiProvider;

  ProductRepository(this._apiProvider);

  // Get all products with pagination
  Future<Map<String, dynamic>> getProducts({
    int page = 1,
    int perPage = 15,
    int? categoryId,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'per_page': perPage,
        if (categoryId != null) 'category_id': categoryId,
      };

      final response = await _apiProvider.get(
        ApiConstants.products,
        queryParameters: queryParams,
      );

      return {
        'products': (response.data['data'] as List)
            .map((product) => ProductModel.fromJson(product))
            .toList(),
        'current_page': response.data['current_page'],
        'total': response.data['total'],
        'per_page': response.data['per_page'],
      };
    } catch (e) {
      rethrow;
    }
  }

  // Get single product
  Future<ProductModel> getProductById(int productId) async {
    try {
      final response = await _apiProvider.get(
        ApiConstants.productDetail(productId),
      );
      return ProductModel.fromJson(response.data['product']);
    } catch (e) {
      rethrow;
    }
  }

  // Get popular products
  Future<List<ProductModel>> getPopularProducts() async {
    try {
      final response = await _apiProvider.get(ApiConstants.popularProducts);
      return (response.data['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // Get special offers
  Future<List<ProductModel>> getSpecialOffers() async {
    try {
      final response = await _apiProvider.get(ApiConstants.specialOffers);
      return (response.data['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // Get banners
  Future<List<ProductModel>> getBanners() async {
    try {
      final response = await _apiProvider.get(ApiConstants.banners);
      return (response.data['banners'] as List)
          .map((banner) => ProductModel.fromJson(banner))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}