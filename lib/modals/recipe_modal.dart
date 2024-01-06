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
