import 'dart:convert';

import 'package:flutterproject/helper/api_helper.dart';
import 'package:flutterproject/block_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterproject/models/recipe_model.dart';

final appStoreProvider = StateNotifierProvider<AppStore, AppState>((ref) {
  var apiHelper = ref.watch(apiHelperProvider);
  return AppStore(apiHelper: apiHelper);
});

class AppStore extends StateNotifier<AppState> {
  final ApiHelper _apiHelper;

  AppStore({required ApiHelper apiHelper})
      : _apiHelper = apiHelper,
        super(AppState()) {
    fetchBlocks();
    fetchCraftingData();
  }

  List<BlockData> _allBlocks = [];
  String _currentSearchQuery = '';
  List<BlockData>? _originalBlocks;

  Future<void> fetchBlocks() async {
    try {
      final response = await _apiHelper.get();
      List<dynamic> blocks = json.decode(response.data);

      final res = <BlockData>[];
      blocks.forEach((block) {
        res.add(BlockData(
          name: block["name"],
          nameSpacedId: block["namespacedId"],
          image: block["image"],
        ));
      });

      _allBlocks = List.from(res);
      _originalBlocks = List.from(res); // Stockez la liste originale

      if (_currentSearchQuery.isNotEmpty) {
        filterBlocks(_currentSearchQuery);
      } else {
        state = state.copyWith(blocks: res);
      }
    } catch (e) {
      print("Erreur lors du chargement des blocs: $e");
    }
  }

  Future<void> fetchCraftingData() async {
    try {
      print("Début chargement des recettes...");
      final recipes = await _apiHelper.getCrafting();
      print("Recettes récupérées: ${recipes.length}");
      
      if (recipes.isNotEmpty) {
        state = state.copyWith(craftingData: recipes);
        print('Recettes chargées avec succès');
      } else {
        print('Aucune recette chargée');
      }
    } catch (e) {
      print('Erreur lors du chargement des recettes: $e');
    }
  }

  void filterBlocks(String query) {
    try {
      print("Filtrage avec la requête: '$query'");
      
      if (_originalBlocks == null) {
        print("Pas de blocs originaux stockés");
        return;
      }

      if (query.isEmpty) {
        state = state.copyWith(blocks: _originalBlocks);
        return;
      }

      final filteredBlocks = _originalBlocks!.where((block) {
        return block.nameSpacedId.toLowerCase().contains(query.toLowerCase());
      }).toList();

      print("Nombre de blocs filtrés: ${filteredBlocks.length}");
      state = state.copyWith(blocks: filteredBlocks);
    } catch (e) {
      print("Erreur lors du filtrage des blocs: $e");
    }
  }

  Future<void> addFavorite(String nameSpacedId) async {
    try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> favoris = prefs.getStringList("favoris") ?? [];
        
        // Formater le nameSpacedId comme dans l'API
        final formattedId = nameSpacedId.toLowerCase().replaceAll(' ', '_');
        
        if (!favoris.contains(formattedId)) {
            favoris.add(formattedId);
            await prefs.setStringList("favoris", favoris);
            state = state.copyWith(nameIdsFavorits: favoris);
            print('Favori ajouté: $formattedId'); // Debug
        }
    } catch (e) {
        print('Erreur lors de l\'ajout du favori: $e');
    }
  }

  Future<void> removeFavorite(String nameSpacedId) async {
    try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> favoris = prefs.getStringList("favoris") ?? [];
        
        // Formater le nameSpacedId comme dans l'API
        final formattedId = nameSpacedId.toLowerCase().replaceAll(' ', '_');
        
        if (favoris.contains(formattedId)) {
            favoris.remove(formattedId);
            await prefs.setStringList("favoris", favoris);
            state = state.copyWith(nameIdsFavorits: favoris);
            print('Favori supprimé: $formattedId'); // Debug
        }
    } catch (e) {
        print('Erreur lors de la suppression du favori: $e');
    }
  }

  Future<bool> isFavorite(String nameSpacedId) async {
    try {
        final prefs = await SharedPreferences.getInstance();
        final favoris = prefs.getStringList('favoris') ?? [];
        final formattedId = nameSpacedId.toLowerCase().replaceAll(' ', '_');
        return favoris.contains(formattedId);
    } catch (e) {
        print('Erreur lors de la vérification du favori: $e');
        return false;
    }
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoris = prefs.getStringList("favoris") ?? [];
    state = state.copyWith(nameIdsFavorits: favoris);
  }

  BlockData getBloc(String nameSpacedId) {
    return state.blocks?.firstWhere(
      (bloc) => bloc.nameSpacedId == nameSpacedId,
      orElse: () => BlockData(name: "Inconnu", nameSpacedId: nameSpacedId, image: ""),
    ) ?? BlockData(name: "Inconnu", nameSpacedId: nameSpacedId, image: "");
  }

  Future<String> getBlockImageUrl(String blockName) async {
    try {
      final formattedName = blockName.toLowerCase().replaceAll(' ', '_');
      final baseUrl = 'https://raw.githubusercontent.com/anish-shanbhag/minecraft-api/master/public/images';
      
      final blockUrl = '$baseUrl/blocks/$formattedName.png';
      final itemUrl = '$baseUrl/items/$formattedName.png';
      
      try {
        final blockResponse = await _apiHelper.checkImageExists(blockUrl);
        if (blockResponse) return blockUrl;
      } catch (_) {}
      
      return itemUrl;
    } catch (e) {
      print('Erreur récupération URL image: $e');
      return '';
    }
  }
}

class AppState {
  final List<BlockData>? blocks;
  final List<String>? nameIdsFavorits;
  final List<Recipe>? craftingData;

  AppState({
    this.blocks,
    this.nameIdsFavorits,
    this.craftingData,
  });

  AppState copyWith({
    List<BlockData>? blocks,
    List<String>? nameIdsFavorits,
    List<Recipe>? craftingData,
  }) {
    return AppState(
      blocks: blocks ?? this.blocks,
      nameIdsFavorits: nameIdsFavorits ?? this.nameIdsFavorits,
      craftingData: craftingData ?? this.craftingData,
    );
  }
}
