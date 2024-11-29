import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
class GrocerySingleItem extends StatelessWidget {
  const GrocerySingleItem({
    super.key,
    required this.groceryItem,
  });

  final GroceryItem groceryItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 20,
          width: 20,
          color: groceryItem.category.color,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(groceryItem.name),
        const Spacer(),
        Text(
          groceryItem.quantity.toString(),
        ),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }
}
