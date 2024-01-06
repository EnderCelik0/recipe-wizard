import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_wizard/pages/profile_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Stock extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {
  List<StockItem> _stockItems = [];
  List<String> _availableMaterials = [
    'Un',
    'Şeker',
    'Tuz',
    'Yağ',
    'Pirinç',
    'Makarna',
    'Salça',
    'Süt',
    'Yumurta',
    'Domates',
    'Soğan',
    'Biber',
    'Patates',
    'Meyve Suyu',
    'Su',
    'Sabun',
    'Tuvalet Kağıdı',
    'Temizlik Malzemeleri',
    'Bulaşık Deterjanı',
  ];
  String _selectedMaterial = 'Un';
  final List<String> _availableUnits = ['Adet', 'Litre', 'Kg'];
  String _selectedUnit = 'Adet';

  @override
  void initState() {
    super.initState();
    _loadStockItems();
  }

  _loadStockItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? stockItemsJson = prefs.getStringList('stockItems');

    if (stockItemsJson != null) {
      setState(() {
        _stockItems =
            stockItemsJson.map((json) => StockItem.fromJson(json)).toList();
      });
    }
  }

  _saveStockItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stockItemsJson =
        _stockItems.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList('stockItems', stockItemsJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock'),
      ),
      body: _buildStockList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddStockDialog(),
        tooltip: 'Add Stock',
        child: Icon(Icons.add),
      ),
      drawer: ProfileDrawer(),
    );
  }

  Widget _buildStockList() {
    return ListView.builder(
      itemCount: _stockItems.length,
      itemBuilder: (context, index) {
        final stockItem = _stockItems[index];
        return ListTile(
          title: Text(stockItem.name),
          subtitle: Text('${stockItem.quantity} ${stockItem.unit}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => _showEditStockDialog(index),
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => _decreaseStockQuantity(index),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _increaseStockQuantity(index),
              ),
            ],
          ),
          onLongPress: () => _removeStockItem(index),
        );
      },
    );
  }

  Future<void> _showAddStockDialog() async {
    TextEditingController quantityController = TextEditingController();
    TextEditingController searchController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // StatefulBuilder kullanarak setState'i dialog içinde kullanabiliriz
            return AlertDialog(
              title: Text('Add Stock Item'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMaterialDropdown(
                      searchController,
                      StockItem(
                        name: _selectedMaterial,
                        quantity: 0,
                        unit: _selectedUnit,
                      )),
                  _buildUnitDropdown(),
                  TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Quantity'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    String quantity = quantityController.text.trim();

                    if (quantity.isNotEmpty) {
                      setState(() {
                        _stockItems.add(
                          StockItem(
                            name: _selectedMaterial,
                            quantity: double.parse(quantity),
                            unit: _selectedUnit,
                          ),
                        );
                        _saveStockItems();
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildMaterialDropdown(
    TextEditingController searchController,
    StockItem stockItem,
  ) {
    List<String> filteredMaterials = _availableMaterials
        .where((material) => material
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();

    if (filteredMaterials.isEmpty) {
      // Eğer filtre sonucunda hiç eleman kalmazsa, "No matching material" mesajını göster
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(labelText: 'Search Material'),
          ),
          Text(
            'No matching material',
            style: TextStyle(color: Colors.red),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: searchController,
          decoration: InputDecoration(labelText: 'Search Material'),
        ),
        DropdownButtonFormField<String>(
          value: stockItem.name,
          items: filteredMaterials
              .map((material) => DropdownMenuItem<String>(
                    value: material,
                    child: Text(material),
                  ))
              .toList(),
          onChanged: (value) => _onMaterialDropdownChanged(value!),
        ),
      ],
    );
  }

  void _onMaterialDropdownChanged(String value) {
    setState(() {
      _selectedMaterial = value;
    });
  }

  Future<void> _showEditStockDialog(int index) async {
    TextEditingController quantityController =
        TextEditingController(text: _stockItems[index].quantity.toString());

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Stock Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMaterialDropdown(
                TextEditingController(text: _stockItems[index].name),
                _stockItems[index],
              ),
              _buildUnitDropdown(),
              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Quantity'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String quantity = quantityController.text.trim();

                if (quantity.isNotEmpty) {
                  setState(() {
                    _stockItems[index].quantity = double.parse(quantity);
                    _stockItems[index].unit = _selectedUnit;
                    _saveStockItems();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildUnitDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedUnit,
      items: _availableUnits
          .map((unit) => DropdownMenuItem<String>(
                value: unit,
                child: Text(unit),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedUnit = value!;
        });
      },
    );
  }

  void _removeStockItem(int index) {
    setState(() {
      _stockItems.removeAt(index);
      _saveStockItems();
    });
  }

  void _increaseStockQuantity(int index) {
    setState(() {
      if (_stockItems[index].unit == 'Adet') {
        _stockItems[index].quantity += 1;
      } else {
        _stockItems[index].quantity += 0.5;
      }
    });
  }

  void _decreaseStockQuantity(int index) {
    if (_stockItems[index].quantity > 0) {
      setState(() {
        if (_stockItems[index].unit == 'Adet') {
          _stockItems[index].quantity -= 1;
        } else {
          _stockItems[index].quantity -= 0.5;
        }
      });
    }
  }
}

class StockItem {
  String name;
  double quantity;
  String unit;

  StockItem({
    required this.name,
    required this.quantity,
    required this.unit,
  });

  factory StockItem.fromJson(String json) {
    Map<String, dynamic> map = Map<String, dynamic>.from(jsonDecode(json));
    return StockItem(
      name: map['name'],
      quantity: map['quantity'],
      unit: map['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'unit': unit,
    };
  }
}
