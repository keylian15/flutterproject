import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Store/app_store.dart';
import '../../models/recipe_model.dart';

class CraftingSlot extends ConsumerWidget {
  final Recipe? recipe;
  final int i;
  final int j;

  const CraftingSlot({
    required this.recipe,
    required this.i,
    required this.j,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (recipe == null || recipe!.item.isEmpty) {
      return Container(
        decoration: const BoxDecoration(
          color: Color(0xFF8B8B8B),
        ),
      );
    }

    try {
      final pattern = recipe!.getPattern();
      final ingredient = pattern[i][j];
      
      if (ingredient == null) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF8B8B8B),
          ),
        );
      }

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
        decoration: const BoxDecoration(
          color: Color(0xFF8B8B8B),
        ),
      );
    }
  }
}