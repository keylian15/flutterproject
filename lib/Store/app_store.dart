import 'dart:convert';

import 'package:flutterproject/helper/api_helper.dart';
import 'package:flutterproject/block_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/blockWidget.dart';

final appStoreProvider = StateNotifierProvider<AppStore, AppStoreState>((ref) {
  var apiHelper = ref.watch(apiHelperProvider);
  return AppStore(api: apiHelper);
});

class AppStore extends StateNotifier<AppStoreState> {
  AppStore({required this.api}) : super(AppStoreState.init()) {
    initStore();
  }

  final ApiHelper api;

  Future<void> initStore() async {
    await getBlocs();
    await loadFavorits();
  }

  Future<void> addFavorits(String nameSpacedId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoris = prefs.getStringList("favoris") ?? [];

    if (!favoris.contains(nameSpacedId)) {
      favoris.add(nameSpacedId);
      await prefs.setStringList("favoris", favoris);
      state = state.copyWith(nameIdsFavorits: favoris);
    }
  }

  Future<void> loadFavorits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoris = prefs.getStringList("favoris") ?? [];
    print("Changement avec les favoris ajout de ${favoris}");
    state = state.copyWith(nameIdsFavorits: favoris);
    print(state.nameIdsFavorits);
  }

  Future<void> getBlocs() async {
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

    state = state.copyWith(blocks: res);
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
