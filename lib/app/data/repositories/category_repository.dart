import '../providers/api_provider.dart';
import '../models/category_model.dart';
import '../../core/constants/api_constants.dart';

class CategoryRepository {
  final ApiProvider _apiProvider;

  CategoryRepository(this._apiProvider);

  // Get all categories
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _apiProvider.get(ApiConstants.categories);
      return (response.data['categories'] as List)
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}