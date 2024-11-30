import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/widget/grocery_single_item.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/widget/new_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<GroceryItem> _groceryItems = [];
  void setItemScreen() async {
    final _newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    setState(() {
      _groceryItems.add(_newItem);
    });
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
      body: _groceryItems.isEmpty
          ? const Center(
              child: Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  'There nothing to be displayed you can add a new grocery'),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (ctx, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Dismissible(
                    background: Container(
                      color: Colors.red,
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        _groceryItems.remove(_groceryItems[index]);
                      });
                    },
                    key: ValueKey(_groceryItems[index].id),
                    child: GrocerySingleItem(groceryItem: _groceryItems[index]),
                  ),
                );
              },
            ),
    );
  }
}
