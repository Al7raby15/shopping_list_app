import 'package:flutter/material.dart';

class Category {
   const Category(this.kind,this.color);

  final String kind;
  final Color color;
}

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}
