import 'package:flutter/material.dart';
import '../widget/navBar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterproject/Store/app_store.dart';
import '../models/recipe_model.dart';
import '../widget/crafting_slot.dart';
import '../widget/result_slot.dart';

class Craftingpage extends ConsumerWidget {
  final String? selectedBlock;
  const Craftingpage({this.selectedBlock, super.key});

  Recipe? getRecipeForBlock(String blockName, List<Recipe> craftingData) {
    try {
      return craftingData.firstWhere(
        (recipe) => recipe.item.toLowerCase() == blockName.toLowerCase(),
        orElse: () => Recipe(
          item: '',
          quantity: 0,
          recipe: List.filled(9, null),
          shapeless: false
        ),
      );
    } catch (e) {
      return Recipe(
        item: '',
        quantity: 0,
        recipe: List.filled(9, null),
        shapeless: false
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStoreProvider);
    Recipe? recipe;

    if (selectedBlock == null) {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/craftingtable.png",
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Aucun bloc sélectionné",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NavBar(currentIndex: 1),
      );
    }

    // Vérifier si le bloc est craftable
    bool isCraftable = state.craftingData != null && 
      ref.read(appStoreProvider.notifier).isBlockCraftable(selectedBlock!);

    if (!isCraftable) {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Ce bloc n'est pas craftable",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 3,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Retour'),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(currentIndex: 1),
      );
    }

    if (state.craftingData == null) {
      // Déclencher le chargement des données si nécessaire
      ref.read(appStoreProvider.notifier).fetchCraftingData();
    }

    if (selectedBlock != null && state.craftingData != null) {
      recipe = getRecipeForBlock(selectedBlock!, List<Recipe>.from(state.craftingData!));
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
                                    child: CraftingSlot(recipe: recipe, i: i, j: j),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    // Slot de résultat
                    Positioned(
                      top: 83,
                      right: 43, // Ajusté pour centrer avec le bouton
                      child: ResultSlot(selectedBlock: selectedBlock),
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