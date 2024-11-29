import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  void saveItem() {
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new item'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              maxLength: 50,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length > 50) {
                  return 'Must be between 1 and 50 charactors';
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.tryParse(value) == null ||
                          int.tryParse(value)! < 0) {
                        return 'Must be a vaild positive number';
                      }
                      return null;
                    },
                    initialValue: '1',
                    decoration: const InputDecoration(
                      label: Text('Quantity'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    items: [
                      for (final catergory in categories.entries)
                        DropdownMenuItem(
                          value: catergory.value,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: catergory.value.color,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(catergory.value.kind),
                            ],
                          ),
                        ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _formKey.currentState!.reset();
                  },
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: saveItem,
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
