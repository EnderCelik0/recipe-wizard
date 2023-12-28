import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  String _selectedUnit = 'Adet';

  final List<String> _units = ['Adet', 'Litre', 'Kilogram'];

  final List<Map<String, dynamic>> _shoppingItems = [];

  @override
  void initState() {
    super.initState();
    _loadShoppingItems();
  }

  Future<void> _loadShoppingItems() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getString('shopping_items');

    if (itemsJson != null) {
      final List<dynamic> decodedItems = json.decode(itemsJson);
      setState(() {
        _shoppingItems.addAll(decodedItems.cast<Map<String, dynamic>>());
      });
    }
  }

  Future<void> _saveShoppingItems() async {
    final prefs = await SharedPreferences.getInstance();

    final List<Map<String, dynamic>> itemsData = _shoppingItems
        .map((item) => {
              'id': item['id'],
              'item': item['item'],
              'quantity': item['quantity'],
              'unit': item['unit'],
            })
        .toList();

    final itemsJson = json.encode(itemsData);
    await prefs.setString('shopping_items', itemsJson);
  }

  void _addItem() {
    final String item = _itemController.text.trim();
    final String quantity = _quantityController.text.trim();

    if (item.isNotEmpty && quantity.isNotEmpty) {
      setState(() {
        _shoppingItems.add({
          'item': item,
          'quantity': quantity,
          'unit': _selectedUnit,
        });
        _itemController.clear();
        _quantityController.clear();
      });

      _saveShoppingItems();
    }
  }

  void _increaseQuantity(int index) {
    setState(() {
      final double currentQuantity =
          double.parse(_shoppingItems[index]['quantity']);
      if (_shoppingItems[index]['unit'] == 'Adet') {
        _shoppingItems[index]['quantity'] = (currentQuantity + 1).toString();
      } else {
        _shoppingItems[index]['quantity'] = (currentQuantity + 0.5).toString();
      }
    });

    _saveShoppingItems();
  }

  void _editQuantity(int index) async {
    String newQuantity = _shoppingItems[index]['quantity'];
    String newUnit = _shoppingItems[index]['unit'];

    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Quantity'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'New Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  newQuantity = value;
                },
              ),
              DropdownButton<String>(
                value: newUnit,
                items: ['Adet', 'Litre', 'Kilogram'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    newUnit = value!;
                  });
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Güncelleme işlemleri burada yapılır
                if (newQuantity.isNotEmpty || newUnit.isNotEmpty) {
                  if (newQuantity != _shoppingItems[index]['quantity'] ||
                      newUnit != _shoppingItems[index]['unit']) {
                    setState(() {
                      _shoppingItems[index]['quantity'] = newQuantity;
                      _shoppingItems[index]['unit'] = newUnit;
                    });
                    _saveShoppingItems();
                    Navigator.of(context).pop('updated');
                    _showAnimatedSnackbar('Quantity updated');
                  } else {
                    _showAnimatedSnackbar('No changes made');
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Update'),
            ),
          ],
        );
      },
    );

    if (result == 'updated') {
      _showAnimatedSnackbar('Quantity updated');
    }
  }

  void _showAnimatedSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _itemController,
              decoration: InputDecoration(labelText: 'Malzeme Adı'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Malzeme Adedi'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12.0),
            DropdownButton<String>(
              value: _selectedUnit,
              items: _units.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedUnit = value!;
                });
              },
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Ekle'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Alınacak Malzemeler',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            _buildShoppingList(),
          ],
        ),
      ),
    );
  }

  void _removeItem(int index) {
    setState(() {
      _shoppingItems.removeAt(index);
      _saveShoppingItems();
    });
  }

  Widget _buildShoppingList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _shoppingItems.length,
        itemBuilder: (context, index) {
          final item = _shoppingItems[index];
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                _editQuantity(index);
              }
              if (direction == DismissDirection.startToEnd) {
                _removeItem(index);
                _showAnimatedSnackbar('Item removed');
              }
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.blue,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.0),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            child: ListTile(
              title:
                  Text('${item['item']} - ${item['quantity']} ${item['unit']}'),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _increaseQuantity(index),
              ),
              onTap: () => _editQuantity(index),
            ),
          );
        },
      ),
    );
  }
}
