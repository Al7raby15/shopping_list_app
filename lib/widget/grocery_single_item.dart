import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';

class GrocerySingleItem extends StatelessWidget {
  const GrocerySingleItem({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (ctx, int index) {
        return Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 20,
              width: 20,
              color: groceryItems[index].category.color,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(groceryItems[index].name),
            const Spacer(),
            Text(
              groceryItems[index].quantity.toString(),
            ),
            const SizedBox(
              width: 8,
            )
          ],
        );
      },
    );
  }
}
