import 'package:flutter/material.dart';
import 'package:recipe_wizard/modals/recipe_modal.dart';
import 'package:recipe_wizard/pages/recipeDetails.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final ValueChanged<bool>? onFavoriteChanged;

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
      width: 300,
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
                    height: cardWidth,
                    width: double.infinity,
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,
                              size: 17.0, color: Colors.yellow[700]),
                          SizedBox(width: 2.0),
                          Text(widget.recipe.rating.toString(),
                              style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
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
                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: getColorForCategory(
                                widget.recipe.allergenCategories[index]),
                          ),
                          child: Center(
                            child: Text(
                              widget.recipe.allergenCategories[index],
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
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
