import 'package:flutter/material.dart';
import 'package:recipe_wizard/pages/Home.dart';

class FavRecipe extends StatefulWidget {
  final List<Recipe> favoriteRecipes;

  const FavRecipe({required this.favoriteRecipes, Key? key}) : super(key: key);

  @override
  State<FavRecipe> createState() => _FavRecipeState();
}

class _FavRecipeState extends State<FavRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes'),
      ),
      body: ListView.builder(
        itemCount: widget.favoriteRecipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.favoriteRecipes[index].title),
            subtitle: Text(widget.favoriteRecipes[index].category),
          );
        },
      ),
    );
  }
}
