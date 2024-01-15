import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_wizard/modals/recipe_modal.dart';
import 'package:recipe_wizard/pages/profile_drawer.dart';
import 'package:recipe_wizard/pages/recipe_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Arama metni ve arama sonuçlarını saklamak için değişkenler
  String searchText = '';
  List<Recipe> searchResults = [];
  List<Recipe> favoriteRecipes = [];
  List<Recipe> recommendedRecipes = [];
  List<Recipe> recommendedRecipesForYou = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    await fetchRecommendedRecipes();
    await fetchRecommendedRecipesForYou();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> fetchRecommendedRecipes() async {
    final response = await http
        .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> meals = data['meals'];

      List<Recipe> fetchedRecipes = meals.map((meal) {
        List<String> ingredients = [];
        for (int i = 1; i <= 20; i++) {
          String ingredient = meal['strIngredient$i'];
          String measure = meal['strMeasure$i'];

          if (ingredient.isNotEmpty) {
            String formattedIngredient = '$measure $ingredient';
            ingredients.add(formattedIngredient);
          }
        }

        return Recipe(
          thumbnail: meal['strMealThumb'] ?? '',
          title: meal['strMeal'] ?? '',
          duration: '30 dakika',
          category: meal['strCategory'] ?? '',
          rating: 4.0,
          allergenCategories: ['Alerjen Yok'],
          ingredients: ingredients,
          steps: [
            meal['strInstructions'] ?? '',
          ],
        );
      }).toList();

      setState(() {
        recommendedRecipes = fetchedRecipes;
      });
    } else {
      throw Exception('Failed to load recommended recipes from API');
    }
  }

  Future<void> fetchRecommendedRecipesForYou() async {
    final response = await http
        .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> meals = data['meals'];

      List<Recipe> fetchedRecipes = meals.map((meal) {
        List<String> ingredients = [];
        for (int i = 1; i <= 20; i++) {
          String ingredient = meal['strIngredient$i'];
          String measure = meal['strMeasure$i'];

          if (ingredient.isNotEmpty) {
            String formattedIngredient = '$measure $ingredient';
            ingredients.add(formattedIngredient);
          }
        }

        return Recipe(
          thumbnail: meal['strMealThumb'] ?? '',
          title: meal['strMeal'] ?? '',
          duration: '30 dakika',
          category: meal['strCategory'] ?? '',
          rating: 4.0,
          allergenCategories: ['Alerjen Yok'],
          ingredients: ingredients,
          steps: [
            meal['strInstructions'] ?? '',
          ],
        );
      }).toList();

      setState(() {
        recommendedRecipesForYou = fetchedRecipes;
      });
    } else {
      throw Exception('Failed to load recommended recipes for you from API');
    }
  }

  // void updateSearchResults() {
  //   searchResults = recipes.where((recipe) {
  //     return recipe.title.toLowerCase().contains(searchText.toLowerCase());
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.green[100],
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
                // updateSearchResults();
              });
            },
            decoration: InputDecoration(
              hintText: 'Tarif Ara',
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.black),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          buildCategoryListView(
              "Önerilen Tarifler", recommendedRecipes, isLoading),
          buildCategoryListView(
              "Sizin İçin Tarifler", recommendedRecipesForYou, isLoading),
          buildCategoryListView(
              "Son Görüntülenen Tarifler", recommendedRecipes, isLoading),
          // buildCategoryListView(
          //     "Stoğunuzdakilere Göre Tarifler", recipes, isLoading),
        ],
      ),
    );
  }

  Widget buildCategoryListView(
      String category, List<Recipe> recipes, bool isLoading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
        isLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[300],
                  ),
                  height: 150,
                  width: MediaQuery.sizeOf(context).width / 1.1,
                  child: Shimmer.fromColors(
                    baseColor: Color(0xE7E7E7),
                    highlightColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[300],
                      ),
                      width: 200.0,
                      height: 100.0,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(
                height: MediaQuery.sizeOf(context).height / 3.6,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                      recipe: recipes[index],
                      onFavoriteChanged: (isFavorite) {},
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 8.0);
                  },
                ),
              ),
        SizedBox(height: 15.0)
      ],
    );
  }
}
