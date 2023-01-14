// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:genilson_app/models/ProductModel/ProductModel.dart';

class OrderModel {
  final ProductModel product;
  int quantity;
  double priceMultiplied;
  OrderModel({
    required this.product,
    required this.quantity,
    required this.priceMultiplied,
  });

  OrderModel copyWith({
    ProductModel? product,
    int? quantity,
    double? priceMultiplied,
  }) {
    return OrderModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      priceMultiplied: priceMultiplied ?? this.priceMultiplied,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
      'priceMultiplied': priceMultiplied,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
      priceMultiplied: map['priceMultiplied'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrderModel(product: $product, quantity: $quantity, priceMultiplied: $priceMultiplied)';

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        other.quantity == quantity &&
        other.priceMultiplied == priceMultiplied;
  }

  @override
  int get hashCode =>
      product.hashCode ^ quantity.hashCode ^ priceMultiplied.hashCode;
}
