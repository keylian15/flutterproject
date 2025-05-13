class Recipe {
  final String result;
  final List<String> pattern;
  final Map<String, String> ingredients;

  Recipe({
    required this.result,
    required this.pattern,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      result: json['result'] as String,
      pattern: List<String>.from(json['pattern']),
      ingredients: Map<String, String>.from(json['ingredients']),
    );
  }
}
