class CartModel {
  final int id;
  final List<CartItemModel> items;
  final int totalQuantity;
  final String total;

  CartModel({
    required this.id,
    required this.items,
    required this.totalQuantity,
    required this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] ?? 0,
      items: (json['items'] as List?)
              ?.map((item) => CartItemModel.fromJson(item))
              .toList() ??
          [],
      totalQuantity: json['total_quantity'] ?? 0,
      total: json['total']?.toString() ?? '0.00',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((item) => item.toJson()).toList(),
      'total_quantity': totalQuantity,
      'total': total,
    };
  }

  double get totalAsDouble => double.tryParse(total) ?? 0.0;
}

class CartItemModel {
  final int id;
  final int productId;
  final String productName;
  final String? productImage;
  final int quantity;
  final String price;
  final String subtotal;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.productName,
    this.productImage,
    required this.quantity,
    required this.price,
    required this.subtotal,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      productName: json['product_name'] ?? '',
      productImage: json['product_image'],
      quantity: json['quantity'] ?? 1,
      price: json['price']?.toString() ?? '0.00',
      subtotal: json['subtotal']?.toString() ?? '0.00',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'product_name': productName,
      'product_image': productImage,
      'quantity': quantity,
      'price': price,
      'subtotal': subtotal,
    };
  }

  double get priceAsDouble => double.tryParse(price) ?? 0.0;
  double get subtotalAsDouble => double.tryParse(subtotal) ?? 0.0;

  // Helper to get full image URL
  String getImageUrl(String baseUrl) {
    if (productImage == null || productImage!.isEmpty) {
      return 'https://via.placeholder.com/100x100.png?text=No+Image';
    }
    if (productImage!.startsWith('http')) {
      return productImage!;
    }
    return '$baseUrl/storage/$productImage';
  }
}