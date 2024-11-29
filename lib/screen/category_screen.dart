import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_Item.dart';
import 'package:shopping_list_app/widget/grocery_single_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: const GrocerySingleItem(),
    );
  }
}
