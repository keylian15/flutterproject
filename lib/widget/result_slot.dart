import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Store/app_store.dart';
import '../../models/recipe_model.dart';

class ResultSlot extends ConsumerWidget {
  final String? selectedBlock;

  const ResultSlot({
    required this.selectedBlock,
    Key? key,
  }) : super(key: key);

  Recipe? _getRecipeForBlock(String blockName, List<Recipe> craftingData) {
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
    if (selectedBlock == null) return Container();

    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(appStoreProvider);
        Recipe? recipe;
        int quantity = 1;

        if (state.craftingData != null) {
          recipe = _getRecipeForBlock(selectedBlock!, List<Recipe>.from(state.craftingData!));
          if (recipe != null) {
            quantity = recipe.quantity;
          }
        }

        return Column(
          children: [
            Container(
              width: 67,
              height: 67,
              decoration: const BoxDecoration(
                color: Color(0xFF8B8B8B),
              ),
              child: FutureBuilder<String>(
                future: ref.read(appStoreProvider.notifier).getBlockImageUrl(selectedBlock!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Stack(
                    children: [
                      Image.network(
                        snapshot.data ?? '',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stack) {
                          return Center(
                            child: Text(
                              selectedBlock!,
                              style: const TextStyle(fontSize: 8),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),
                      if (quantity > 1)
                        Positioned(
                          right: 4,
                          bottom: 4,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            FutureBuilder<bool>(
              future: ref.read(appStoreProvider.notifier).isFavorite(selectedBlock!),
              builder: (context, snapshot) {
                final isFavorite = snapshot.data ?? false;
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      ref.read(appStoreProvider.notifier).removeFavorite(selectedBlock!);
                    } else {
                      ref.read(appStoreProvider.notifier).addFavorite(selectedBlock!);
                    }
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}