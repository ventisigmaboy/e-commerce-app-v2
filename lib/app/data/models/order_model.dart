class OrderModel {
  final int id;
  final String status;
  final String totalPrice;
  final String customerName;
  final String customerEmail;
  final ShippingAddress shippingAddress;
  final List<OrderItemModel> items;
  final String createdAt;

  OrderModel({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.customerName,
    required this.customerEmail,
    required this.shippingAddress,
    required this.items,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? 0,
      status: json['status'] ?? '',
      totalPrice: json['total_price']?.toString() ?? '0.00',
      customerName: json['customer_name'] ?? '',
      customerEmail: json['customer_email'] ?? '',
      shippingAddress: ShippingAddress.fromJson(json['shipping_address'] ?? {}),
      items: (json['items'] as List?)
              ?.map((item) => OrderItemModel.fromJson(item))
              .toList() ??
          [],
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'total_price': totalPrice,
      'customer_name': customerName,
      'customer_email': customerEmail,
      'shipping_address': shippingAddress.toJson(),
      'items': items.map((item) => item.toJson()).toList(),
      'created_at': createdAt,
    };
  }

  double get totalPriceAsDouble => double.tryParse(totalPrice) ?? 0.0;

  String get statusDisplay {
    switch (status.toLowerCase()) {
      case 'pending':
        return 'Pending';
      case 'processing':
        return 'Processing';
      case 'shipped':
        return 'Shipped';
      case 'delivered':
        return 'Delivered';
      case 'cancelled':
        return 'Cancelled';
      default:
        return status;
    }
  }
}

class OrderItemModel {
  final int id;
  final String productName;
  final int quantity;
  final String unitPrice;

  OrderItemModel({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] ?? 0,
      productName: json['product_name'] ?? '',
      quantity: json['quantity'] ?? 1,
      unitPrice: json['unit_price']?.toString() ?? '0.00',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_name': productName,
      'quantity': quantity,
      'unit_price': unitPrice,
    };
  }

  double get unitPriceAsDouble => double.tryParse(unitPrice) ?? 0.0;
  double get subtotal => unitPriceAsDouble * quantity;
}

class ShippingAddress {
  final String street;
  final String city;
  final String state;
  final String zip;
  final String country;

  ShippingAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zip: json['zip'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'zip': zip,
      'country': country,
    };
  }

  String get fullAddress {
    return '$street, $city, $state $zip, $country';
  }
}