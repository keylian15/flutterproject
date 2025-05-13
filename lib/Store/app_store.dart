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
      final recipes = await _apiHelper.getCrafting();
      state = state.copyWith(craftingData: recipes);
      print('Recettes chargées: ${recipes.length}');
    } catch (e) {
      print('Erreur lors du chargement des recettes: $e');
    }
  }

  void filterBlocks(String query) {
    _currentSearchQuery = query;

    if (query.isEmpty) {
      state = state.copyWith(blocks: List.from(_allBlocks));
    } else {
      final filteredBlocks = _allBlocks.where((block) =>
          (block.name?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (block.nameSpacedId?.toLowerCase().contains(query.toLowerCase()) ?? false)).toList();

      state = state.copyWith(blocks: filteredBlocks);
    }
  }

  Future<void> addFavorite(String nameSpacedId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoris = prefs.getStringList("favoris") ?? [];

    if (!favoris.contains(nameSpacedId)) {
      favoris.add(nameSpacedId);
      await prefs.setStringList("favoris", favoris);
      state = state.copyWith(nameIdsFavorits: favoris);
    }
  }

  Future<void> removeFavorite(String nameSpacedId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoris = prefs.getStringList("favoris") ?? [];

    if (favoris.contains(nameSpacedId)) {
      favoris.remove(nameSpacedId);
      await prefs.setStringList("favoris", favoris);
      state = state.copyWith(nameIdsFavorits: favoris);
    }
  }

  Future<bool> isFavorite(String nameSpacedId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoris = prefs.getStringList('favoris') ?? [];
    return favoris.contains(nameSpacedId);
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
