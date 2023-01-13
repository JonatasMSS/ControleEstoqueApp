// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final int quantity;
  final double quantityMultplied;
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.quantityMultplied = 0,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    double? price,
    int? quantity,
    double? quantityMultplied,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      quantityMultplied: quantityMultplied ?? this.quantityMultplied,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'quantityMultplied': quantityMultplied,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      quantityMultplied: map['quantityMultplied'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, price: $price, quantity: $quantity, quantityMultplied: $quantityMultplied)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.quantity == quantity &&
        other.quantityMultplied == quantityMultplied;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        quantityMultplied.hashCode;
  }
}
