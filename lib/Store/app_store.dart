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
    getAllItem();
  }

  final ApiHelper api;

  // TODO : Fonctions utiles
  void resetValues(AppStore store, AppStoreState state) {}

  void saveValue() {
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      // prefs.setDouble(AppConst.weightKey, state.weightKg);
    });
  }

  void getAllItem() {
    // Récupération des blocs + Création de ces derniers.
    api.get().then((response) {
      List<dynamic> blocks = json.decode(response.data);

      final res = <BlockData>[];
      blocks.forEach((block) {
        res.add(BlockData(
            name: block["name"],
            nameSpaceId: block["namespaceId"],
            image: block["image"]));
      });

      state = state.copyWith(blocks: res);
    });
  }

  void getItem(String name) {
    // Récupération des blocs + Création de ces derniers.
    api.get().then((response) {
      List<dynamic> blocks = json.decode(response.data);

      final res = <BlockData>[];
      blocks.forEach((block) {
        if (name == block["name"]) {
          res.add(BlockData(
              name: block["name"],
              nameSpaceId: block["namespaceId"],
              image: block["image"]));
        }
        ;
      });
    });
  }
}

class AppStoreState {
  //variables
  final List<BlockData> blocks;

  //constructeur
  AppStoreState({required this.blocks});

  factory AppStoreState.init() {
    return AppStoreState(blocks: []);
  }

  AppStoreState copyWith({List<BlockData>? blocks}) {
    return AppStoreState(blocks: blocks ?? this.blocks);
  }
}
