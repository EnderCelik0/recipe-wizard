import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_wizard/pages/Home.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;

  RecipeDetails({required this.recipe});

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animasyon kontrolcüsü ve animasyonun başlangıç değeri
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    // Slide animasyonu için tanımlama
    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Fade animasyonu için tanımlama
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Animasyonları başlat
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Image.asset(
                  widget.recipe.thumbnail,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.recipe.title,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 28.0, color: Colors.yellow[700]),
                              SizedBox(width: 4.0),
                              Text(
                                widget.recipe.rating.toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily:
                                        GoogleFonts.roboto().fontFamily),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Icon(Icons.timer, size: 20.0),
                          SizedBox(width: 4.0),
                          Text(
                            widget.recipe.duration,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Icon(Icons.category, size: 20.0),
                          SizedBox(width: 4.0),
                          Text(
                            widget.recipe.category,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      _buildContainer(
                        'Alerjenler:',
                        Wrap(
                          spacing: 4.0,
                          children: widget.recipe.allergenCategories
                              .map(
                                (category) => Chip(
                                  label: Text(
                                    category,
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily),
                                  ),
                                  backgroundColor:
                                      getColorForCategory(category),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      _buildContainer(
                        'Malzemeler:',
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.recipe.ingredients
                              .map((ingredient) => Text(
                                    '- $ingredient',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily),
                                  ))
                              .toList(),
                        ),
                      ),
                      _buildContainer(
                        'Yapılış:',
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.recipe.steps
                              .asMap()
                              .entries
                              .map((entry) => Text(
                                    '${entry.key + 1}. ${entry.value}',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(String title, Widget content) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          content,
        ],
      ),
    );
  }
}
