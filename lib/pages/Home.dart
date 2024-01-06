import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_wizard/modals/recipe_modal.dart';
import 'package:recipe_wizard/pages/profile_drawer.dart';
import 'package:recipe_wizard/pages/recipe_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Tarif kartlarını içeren bir liste
  final List<Recipe> recipes = [
    Recipe(
      thumbnail: 'assets/omlette.jpg',
      title: 'Omlet',
      duration: '15 dakika',
      category: 'Kahvaltı',
      rating: 4.5,
      allergenCategories: ['Deniz Ürünü', 'Acı'],
      ingredients: ['Yumurta', 'Süt', 'Tuz', 'Karabiber'],
      steps: [
        'Yumurtaları bir kaba kırın.',
        'Süt, tuz ve karabiber ekleyin.',
        'Karışımı çırpın ve tavada pişirin.',
      ],
    ),
    Recipe(
      thumbnail: 'assets/OvenChicken.jpg',
      title: 'Fırın Tavuk',
      duration: '1 saat',
      category: 'Akşam Yemeği',
      rating: 3.5,
      allergenCategories: ['Baharatlı', 'Gluten'],
      ingredients: ['Tavuk', 'Baharatlar', 'Zeytinyağı', 'Tuz'],
      steps: [
        'Tavukları baharatlarla marine edin.',
        'Fırına yerleştirin ve pişirin.',
        'Afiyet olsun!',
      ],
    ),
    Recipe(
      thumbnail: 'assets/Guac.jpg',
      title: 'Guacamole',
      duration: '10 dakika',
      category: 'Atıştırmalık',
      rating: 4.0,
      allergenCategories: ['Alerjen Yok'],
      ingredients: ['Avokado', 'Soğan', 'Domates', 'Limonsuyu'],
      steps: [
        'Avokadoları ezin.',
        'Soğanı ve domatesi doğrayın ve avokadoya ekleyin.',
        'Limonsuyu ekleyip karıştırın.',
      ],
    ),
    Recipe(
      thumbnail: 'assets/Salmon.jpg',
      title: 'Izgara Somon',
      duration: '30 dakika',
      category: 'Akşam Yemeği',
      rating: 4.5,
      allergenCategories: ['Deniz Ürünü', 'Alerjen Yok', 'Gluten'],
      ingredients: ['Somon', 'Zeytinyağı', 'Limon', 'Tuz'],
      steps: [
        'Somonu marine edin.',
        'Izgarada pişirin ve limon ile servis yapın.',
      ],
    ),
    Recipe(
      thumbnail: 'assets/Smoothie.jpg',
      title: 'Smoothie Bowl',
      duration: '10 dakika',
      category: 'Kahvaltı',
      rating: 4.9,
      allergenCategories: ['Alerjen Yok'],
      ingredients: ['Meyve', 'Yoğurt', 'Bal', 'Granola'],
      steps: [
        'Meyveleri blenderdan geçirin.',
        'Yoğurt ve bal ekleyip karıştırın.',
        'Üzerine granola serpip servis yapın.',
      ],
    ),
  ];

  // Arama metni ve arama sonuçlarını saklamak için değişkenler
  String searchText = '';
  List<Recipe> searchResults = [];
  List<Recipe> favoriteRecipes = [];

  void updateSearchResults() {
    searchResults = recipes.where((recipe) {
      return recipe.title.toLowerCase().contains(searchText.toLowerCase());
    }).toList();
  }

  void updateFavoriteRecipes(Recipe recipe, bool isFavorite) {
    setState(() {
      if (isFavorite) {
        favoriteRecipes.add(recipe);
      } else {
        favoriteRecipes.remove(recipe);
      }
    });
  }

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
                updateSearchResults();
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
          buildCategoryListView("Önerilen Tarifler", recipes),
          buildCategoryListView("Sizin İçin Tarifler", recipes),
          buildCategoryListView("Son Görüntülenen Tarifler", recipes),
          buildCategoryListView("Stoğunuzdakilere Göre Tarifler", recipes),
        ],
      ),
    );
  }

  Widget buildCategoryListView(String category, List<Recipe> recipes) {
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
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
        ),
        SizedBox(
          height: 263, // Set the desired height for each category
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(
                recipe: recipes[index],
                onFavoriteChanged: (isFavorite) {
                  updateFavoriteRecipes(recipes[index], isFavorite);
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10.0);
            },
          ),
        ),
      ],
    );
  }
}
