import 'package:flutter/material.dart';
import 'package:shopping_list_app/widget/grocery_single_item.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/widget/new_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void setItemScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: setItemScreen, icon: const Icon(Icons.add)),
        ],
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, int index) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: GrocerySingleItem(groceryItem: groceryItems[index]),
          );
        },
      ),
    );
  }
}
