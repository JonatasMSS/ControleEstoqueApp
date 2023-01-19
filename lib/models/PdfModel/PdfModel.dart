// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:genilson_app/models/OrderModel/OrderModel.dart';

class PdfModel {
  String clientName;

  double valueTotal;
  List<OrderModel> order;
  PdfModel({
    required this.clientName,
    required this.valueTotal,
    required this.order,
  });

  String emissionDate() {
    final DateTime actualDate = DateTime.now();
    final String date =
        '${actualDate.day}/${actualDate.month}/${actualDate.year}';
    return date;
  }

  PdfModel copyWith({
    String? clientName,
    double? valueTotal,
    List<OrderModel>? order,
  }) {
    return PdfModel(
      clientName: clientName ?? this.clientName,
      valueTotal: valueTotal ?? this.valueTotal,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientName': clientName,
      'valueTotal': valueTotal,
      'order': order.map((x) => x.toMap()).toList(),
    };
  }

  factory PdfModel.fromMap(Map<String, dynamic> map) {
    return PdfModel(
      clientName: map['clientName'] as String,
      valueTotal: map['valueTotal'] as double,
      order: List<OrderModel>.from(
        (map['order'] as List<int>).map<OrderModel>(
          (x) => OrderModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PdfModel.fromJson(String source) =>
      PdfModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PdfModel(clientName: $clientName, valueTotal: $valueTotal, order: $order)';

  @override
  bool operator ==(covariant PdfModel other) {
    if (identical(this, other)) return true;

    return other.clientName == clientName &&
        other.valueTotal == valueTotal &&
        listEquals(other.order, order);
  }

  @override
  int get hashCode =>
      clientName.hashCode ^ valueTotal.hashCode ^ order.hashCode;
}
