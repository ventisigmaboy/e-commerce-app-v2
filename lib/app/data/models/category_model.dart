class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final int productsCount;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.productsCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'] ?? '',
      productsCount: json['products_count'] ?? 0,
    );
  }
}

class CategoryListResponse {
  final List<CategoryModel> categories;

  CategoryListResponse({required this.categories});

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) {
    return CategoryListResponse(
      categories: (json['categories'] as List)
          .map((categoryJson) => CategoryModel.fromJson(categoryJson))
          .toList(),
    );
  }
}