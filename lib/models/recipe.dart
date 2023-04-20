import 'dart:convert';

import 'package:flutter/foundation.dart';

class Recipe {

  final int id;
  final String title;
  final String image;
  final int positiveRatings;
  final int negativeRatings;
  final List<String> ingredients;
  final List<String> instructions;
  
  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.positiveRatings,
    required this.negativeRatings,
    required this.ingredients,
    required this.instructions,
  });

  Recipe copyWith({
    int? id,
    String? title,
    String? image,
    int? positiveRatings,
    int? negativeRatings,
    List<String>? ingredients,
    List<String>? instructions,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      positiveRatings: positiveRatings ?? this.positiveRatings,
      negativeRatings: negativeRatings ?? this.negativeRatings,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title.replaceAll(RegExp(r'[^A-Za-z0-9().,;?]'), ' '),
      'image': image,
      'positiveRatings': positiveRatings,
      'negativeRatings': negativeRatings,
      'ingredients': jsonEncode(ingredients.map((e) => e.replaceAll(RegExp(r'[^A-Za-z0-9().,;?]'), ' ')).toList()),
      'instructions': jsonEncode(instructions.map((e) => e.replaceAll(RegExp(r'[^A-Za-z0-9().,;?]'), ' ')).toList()),
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      positiveRatings: map['positiveRatings']?.toInt() ?? 0,
      negativeRatings: map['negativeRatings']?.toInt() ?? 0,
      ingredients: List<String>.from(jsonDecode(map['ingredients'])),
      instructions: List<String>.from(jsonDecode(map['instructions'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Recipe(id: $id, title: $title, image: $image, positiveRatings: $positiveRatings, negativeRatings: $negativeRatings, ingredients: $ingredients, instructions: $instructions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Recipe &&
      other.id == id &&
      other.title == title &&
      other.image == image &&
      other.positiveRatings == positiveRatings &&
      other.negativeRatings == negativeRatings &&
      listEquals(other.ingredients, ingredients) &&
      listEquals(other.instructions, instructions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      image.hashCode ^
      positiveRatings.hashCode ^
      negativeRatings.hashCode ^
      ingredients.hashCode ^
      instructions.hashCode;
  }
}
