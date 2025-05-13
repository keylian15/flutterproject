import 'package:flutter/material.dart';
import '../widget/navBar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterproject/Store/app_store.dart';
import 'package:flutterproject/widget/blockWidget.dart';
import '../models/recipe_model.dart';

class Craftingpage extends ConsumerWidget {
  final String? selectedBlock;
  const Craftingpage({this.selectedBlock, super.key});

  Recipe? getRecipeForBlock(String blockName, List<Recipe> craftingData) {
    try {
      // Convertir le nom du bloc au format attendu (ex: "Crafting Table" -> "crafting_table")
      final searchName = blockName.toLowerCase().replaceAll(' ', '_');
      print("Recherche recette pour '$blockName' (converti en '$searchName')");
      
      return craftingData.firstWhere(
        (recipe) => recipe.result == searchName,
        orElse: () {
          print("Aucune recette trouvée pour: $searchName");
          return Recipe(result: '', pattern: [], ingredients: {});
        },
      );
    } catch (e) {
      print('Erreur recherche recette: $e');
      return Recipe(result: '', pattern: [], ingredients: {});
    }
  }

  Widget buildCraftingSlot(Recipe? recipe, int i, int j) {
    if (recipe == null || i >= recipe.pattern.length) {
      print("Slot vide ($i,$j): recette nulle ou index invalide");
      return Container();
    }

    try {
      final row = recipe.pattern[i];
      print("Pattern ligne $i: $row");
      
      if (j >= row.length) {
        print("Index colonne invalide: $j >= ${row.length}");
        return Container();
      }

      final key = row[j];
      print("Clé à la position ($i,$j): $key");
      
      if (key == ' ') {
        print("Case vide à ($i,$j)");
        return Container();
      }

      final ingredient = recipe.ingredients[key];
      print("Ingrédient trouvé pour $key: $ingredient");
      
      if (ingredient == null) {
        print("Pas d'ingrédient pour la clé: $key");
        return Container();
      }

      final imageUrl = 'https://raw.githubusercontent.com/anish-shanbhag/minecraft-api/master/public/images/blocks/$ingredient.png';
      print("Chargement image: $imageUrl");

      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey[300],
            child: Center(child: CircularProgressIndicator()),
          );
        },
        errorBuilder: (context, error, stack) {
          print('Erreur chargement image $ingredient: $error');
          return Container(
            color: Colors.grey,
            child: Center(
              child: Text(
                ingredient,
                style: TextStyle(fontSize: 8),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      );
    } catch (e) {
      print('Erreur slot ($i,$j): $e');
      return Container(color: Colors.red.withOpacity(0.3));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStoreProvider);
    Recipe? recipe;

    if (selectedBlock != null && state.craftingData != null) {
      recipe = getRecipeForBlock(selectedBlock!, List<Recipe>.from(state.craftingData!));
    }

    if (state.craftingData == null) {
      // Déclencher le chargement des données si nécessaire
      ref.read(appStoreProvider.notifier).fetchCraftingData();
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 90),
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/craftingtable.png", // Utiliser l'image locale
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    // Positionnement des cases
                    Positioned(
                      top: 37,
                      left: 7,
                      child: Column(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Row(
                              children: [
                                for (int j = 0; j < 3; j++)
                                  Container(
                                    margin: const EdgeInsets.all(4),
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF8B8B8B),
                                    ),
                                    child: buildCraftingSlot(recipe, i, j),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    // Slot de résultat
                    Positioned(
                      top: 83,
                      right: 44,
                      child: Container(
                        width: 67,
                        height: 67,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B8B8B),
                        ),
                        child: selectedBlock != null
                          ? Image.network(
                              "https://raw.githubusercontent.com/anish-shanbhag/minecraft-api/master/public/images/blocks/${selectedBlock!.toLowerCase().replaceAll(' ', '_')}.png",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                print('Erreur chargement image: $error');
                                return Container(
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      selectedBlock!,
                                      style: TextStyle(fontSize: 8),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            )
                          : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}