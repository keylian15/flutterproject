class Recipe {
  final String item;
  final int quantity;
  final List<String?> recipe;
  final bool shapeless;

  Recipe({
    required this.item,
    required this.quantity,
    required this.recipe,
    required this.shapeless,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      item: json['item'] as String,
      quantity: json['quantity'] as int,
      recipe: (json['recipe'] as List).map((e) => e as String?).toList(),
      shapeless: json['shapeless'] as bool,
    );
  }

  List<List<String?>> getPattern() {
    List<List<String?>> pattern = [];
    for (int i = 0; i < 3; i++) {
      pattern.add(recipe.sublist(i * 3, (i + 1) * 3));
    }
    return pattern;
  }
}
