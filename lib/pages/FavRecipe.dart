import 'package:flutter/material.dart';
import 'package:recipe_wizard/modals/recipe_modal.dart';
import 'package:recipe_wizard/pages/recipe_card.dart';

class FavRecipe extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  FavRecipe({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes'),
      ),
      body: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            recipe: favoriteRecipes[index],
            onFavoriteChanged: (isFavorite) {
              // Handle favorite status change if needed
            },
          );
        },
      ),
    );
  }
}
