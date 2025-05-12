import 'dart:convert';

import 'package:flutterproject/helper/api_helper.dart';
import 'package:flutterproject/block_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final appStoreProvider = StateNotifierProvider<AppStore, AppStoreState>((ref) {
  var apiHelper = ref.watch(apiHelperProvider);
  return AppStore(api: apiHelper);
});

class AppStore extends StateNotifier<AppStoreState> {
  AppStore({required this.api}) : super(AppStoreState.init()) {
    initStore();
  }

  final ApiHelper api;
  List<BlockData> _allBlocks = []; // Pour stocker tous les blocs non filtrés
  String _currentSearchQuery = '';

  Future<void> initStore() async {
    await getBlocs();
    await loadFavorites();
  }

  // Méthode de filtrage améliorée
  void filterBlocks(String query) {
    _currentSearchQuery = query;
    
    if (query.isEmpty) {
      // Si la requête est vide, afficher tous les blocs
      state = state.copyWith(blocks: List.from(_allBlocks));
    } else {
      // Filtrer les blocs dont le nom contient la requête (insensible à la casse)
      final filteredBlocks = _allBlocks.where((block) => 
        (block.name?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
        (block.nameSpacedId?.toLowerCase().contains(query.toLowerCase()) ?? false)
      ).toList();
      
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

  Future<void> getBlocs() async {
    try {
      final response = await api.get();
      List<dynamic> blocks = json.decode(response.data);

      final res = <BlockData>[];
      blocks.forEach((block) {
        res.add(BlockData(
          name: block["name"],
          nameSpacedId: block["namespacedId"],
          image: block["image"],
        ));
      });

      _allBlocks = List.from(res); // Stocker une copie de tous les blocs
      
      // Appliquer le filtre actuel si une recherche est en cours
      if (_currentSearchQuery.isNotEmpty) {
        filterBlocks(_currentSearchQuery);
      } else {
        state = state.copyWith(blocks: res);
      }
    } catch (e) {
      print("Erreur lors du chargement des blocs: $e");
    }
  }

  BlockData getBloc(String nameSpacedId) {
    return state.blocks.firstWhere(
      (bloc) => bloc.nameSpacedId == nameSpacedId,
      orElse: () =>
          BlockData(name: "Inconnu", nameSpacedId: nameSpacedId, image: ""),
    );
  }
}

class AppStoreState {
  //variables
  final List<BlockData> blocks;
  final List<String> nameIdsFavorits;

  //constructeur
  AppStoreState({required this.blocks, required this.nameIdsFavorits});

  factory AppStoreState.init() {
    return AppStoreState(blocks: [], nameIdsFavorits: []);
  }

  AppStoreState copyWith(
      {List<BlockData>? blocks, List<String>? nameIdsFavorits}) {
    return AppStoreState(
        blocks: blocks ?? this.blocks,
        nameIdsFavorits: nameIdsFavorits ?? this.nameIdsFavorits);
  }
}
