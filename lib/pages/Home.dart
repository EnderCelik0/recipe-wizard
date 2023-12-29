import 'package:flutter/material.dart';
import 'package:recipe_wizard/pages/profile_drawer.dart';
import 'package:recipe_wizard/pages/recipeDetails.dart';

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

  @override
  Widget build(BuildContext context) {
    // Arama sonuçlarını güncelleyen fonksiyon
    void updateSearchResults() {
      searchResults = recipes.where((recipe) {
        return recipe.title.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    }

    return MaterialApp(
      home: Scaffold(
        drawer: ProfileDrawer(),
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white, // Light tema için arkaplan rengi
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                  updateSearchResults();
                });
              },
              decoration: InputDecoration(
                hintText: 'Tarif Ara...',
                hintStyle: TextStyle(
                    color: Colors.black54), // Light tema için gri tonu
                border: InputBorder.none,
                icon: Icon(Icons.search,
                    color: Colors.black), // Light tema için arama simgesi rengi
              ),
              style: TextStyle(
                color: Colors.black, // Light tema için metin rengi
                fontSize: 16.0, // Light tema için metin boyutu
                // Diğer özelleştirmeleri buraya ekleyebilirsiniz
              ),
            ),
          ),
        ),
        body: ListView(
          children: searchResults.isNotEmpty
              ? searchResults
                  .map((recipe) => RecipeCard(recipe: recipe))
                  .toList()
              : recipes.map((recipe) => RecipeCard(recipe: recipe)).toList(),
        ),
      ),
    );
  }
}

class Recipe {
  final String thumbnail;
  final String title;
  final String duration;
  final String category;
  final double rating;
  final List<String> allergenCategories;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.thumbnail,
    required this.title,
    required this.duration,
    required this.category,
    required this.allergenCategories,
    required this.rating,
    this.ingredients = const [],
    this.steps = const [],
  });
}

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final ValueChanged<bool>?
      onFavoriteChanged; // "?" ekleyerek opsiyonel hale getirildi

  RecipeCard({required this.recipe, this.onFavoriteChanged});

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 3;

    return SizedBox(
      width: cardWidth,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    // Tarif detaylarını göstermek için RecipeDetails sayfasına geçiş yap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetails(
                          recipe: widget.recipe,
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                    widget.recipe.thumbnail,
                    width: double.infinity,
                    height: cardWidth,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      // widget.onFavoriteChanged'e null check ekleyerek çağrılıp çağrılmadığını kontrol ediyoruz
                      widget.onFavoriteChanged?.call(isFavorite);
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 22.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.recipe.title,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 4.0),
                          Icon(Icons.star,
                              size: 17.0, color: Colors.yellow[700]),
                          SizedBox(width: 2.0),
                          Text(widget.recipe.rating.toString(),
                              style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timer, size: 16.0),
                          SizedBox(width: 2.0),
                          Text(widget.recipe.duration,
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.category, size: 16.0),
                          SizedBox(width: 2.0),
                          Text(widget.recipe.category,
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  SizedBox(
                    height: 25.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.recipe.allergenCategories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 4.0),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: getColorForCategory(
                                widget.recipe.allergenCategories[index]),
                          ),
                          child: Center(
                            child: Text(
                              widget.recipe.allergenCategories[index],
                              style:
                                  TextStyle(fontSize: 11, color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color getColorForCategory(String category) {
  // Kategoriye göre renk belirleme
  switch (category) {
    case 'Deniz Ürünü':
      return Colors.lightBlueAccent;
    case 'Acı':
      return Colors.orange;
    case 'Baharatlı':
      return Colors.redAccent;
    case 'Gluten':
      return Colors.amber;
    default:
      return Colors.green; // Alerjen yok veya diğer durumlar
  }
}
