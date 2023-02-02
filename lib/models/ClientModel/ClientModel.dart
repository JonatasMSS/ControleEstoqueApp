import 'dart:convert';

import 'package:objectbox/objectbox.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

@Entity()
class ClientModel {
  @Id()
  int id;
  String name;
  int number;
  String date;
  ClientModel({
    this.id = 0,
    required this.name,
    required this.number,
    required this.date,
  });

  ClientModel copyWith({
    int? id,
    String? name,
    int? number,
    String? date,
  }) {
    return ClientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'number': number,
      'date': date,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] as int,
      name: map['name'] as String,
      number: map['number'] as int,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClientModel(id: $id, name: $name, number: $number, date: $date)';
  }

  @override
  bool operator ==(covariant ClientModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.number == number &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ number.hashCode ^ date.hashCode;
  }
}
