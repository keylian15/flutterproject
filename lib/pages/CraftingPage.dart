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
      print("Recherche recette pour '$blockName'");

      final recipe = craftingData.firstWhere(
        (recipe) {
          return recipe.item.toLowerCase() == blockName.toLowerCase();
        },
        orElse: () {
          print("Aucune recette trouvée pour: $blockName");
          return Recipe(
            item: '',
            quantity: 0,
            recipe: List.filled(9, null),
            shapeless: false
          );
        },
      );

      if (recipe.item.isNotEmpty) {
        print("Recette trouvée: ${recipe.item}");
        print("Pattern: ${recipe.getPattern()}");
      }

      return recipe;
    } catch (e) {
      print('Erreur recherche recette: $e');
      return Recipe(
        item: '',
        quantity: 0,
        recipe: List.filled(9, null),
        shapeless: false
      );
    }
  }

  Widget buildCraftingSlot(Recipe? recipe, int i, int j, WidgetRef ref) {
    if (recipe == null || recipe.item.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF8B8B8B),
        ),
      );
    }

    try {
      final pattern = recipe.getPattern();
      final ingredient = pattern[i][j];
      
      if (ingredient == null) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF8B8B8B),
          ),
        );
      }

      // Utilisation de l'AppStore pour obtenir l'URL de l'image
      return Consumer(
        builder: (context, ref, child) {
          return FutureBuilder<String>(
            future: ref.read(appStoreProvider.notifier).getBlockImageUrl(ingredient),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return Image.network(
                snapshot.data ?? '',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stack) {
                  print('Erreur chargement image pour $ingredient: $error');
                  return Center(
                    child: Text(
                      ingredient,
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              );
            },
          );
        },
      );
    } catch (e) {
      print('Erreur construction slot ($i,$j): $e');
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF8B8B8B),
        ),
      );
    }
  }

  Widget buildResultSlot(String? selectedBlock, WidgetRef ref) {
    if (selectedBlock == null) return Container();

    return Consumer(
      builder: (context, ref, child) {
        return FutureBuilder<String>(
          future: ref.read(appStoreProvider.notifier).getBlockImageUrl(selectedBlock),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return Image.network(
              snapshot.data ?? '',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stack) {
                return Center(
                  child: Text(
                    selectedBlock,
                    style: const TextStyle(fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            );
          },
        );
      },
    );
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
                                    child: buildCraftingSlot(recipe, i, j, ref),
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
                        child: buildResultSlot(selectedBlock, ref),
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