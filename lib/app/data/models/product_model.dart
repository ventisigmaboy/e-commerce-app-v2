class ProductModel {
  final int id;
  final String name;
  final String slug;
  final String? description;
  final String price;
  final int stock;
  final String? image;
  final bool isVisible;
  final CategoryData? category;

  ProductModel({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    required this.price,
    required this.stock,
    this.image,
    required this.isVisible,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'],
      price: json['price']?.toString() ?? '0.00',
      stock: json['stock'] ?? 0,
      image: json['image'],
      isVisible: json['is_visible'] ?? true,
      category: json['category'] != null 
          ? CategoryData.fromJson(json['category']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'price': price,
      'stock': stock,
      'image': image,
      'is_visible': isVisible,
      'category': category?.toJson(),
    };
  }

  // Helper to get full image URL
  String getImageUrl(String baseUrl) {
    if (image == null || image!.isEmpty) {
      return 'https://via.placeholder.com/300x300.png?text=No+Image';
    }
    // If image already has http/https, return as is
    if (image!.startsWith('http')) {
      return image!;
    }
    // Otherwise, prepend base URL
    return '$baseUrl/storage/$image';
  }

  double get priceAsDouble => double.tryParse(price) ?? 0.0;
}

class CategoryData {
  final int id;
  final String name;

  CategoryData({
    required this.id,
    required this.name,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}