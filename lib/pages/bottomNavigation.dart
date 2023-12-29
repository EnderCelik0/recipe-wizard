import 'package:flutter/material.dart';
import 'package:recipe_wizard/pages/FavRecipe.dart';
import 'package:recipe_wizard/pages/Home.dart';
import 'package:recipe_wizard/pages/ShoppingList.dart';
import 'package:recipe_wizard/pages/Stock.dart';

class BottomNavigation extends StatefulWidget {
  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    FavRecipe(favoriteRecipes: []),
    ShoppingList(),
    Stock(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Shopping List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage_rounded),
            label: 'Stock',
          ),
        ],
      ),
    );
  }
}
