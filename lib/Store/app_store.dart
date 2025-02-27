import 'package:flutterproject/helper/api_helper.dart';
import 'package:flutterproject/widget/block.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStoreProvider = StateNotifierProvider<AppStore, AppStoreState>((ref) {
  var apiHelper = ref.watch(apiHelperProvider);
  return AppStore(api: apiHelper);
});

class AppStore extends StateNotifier<AppStoreState> {
  AppStore({required this.api}) : super(AppStoreState.init()) {
    SharedPreferences.getInstance().then((prefs) {
      state = state.copyWith(
          // weightKg: prefs.getDouble(AppConst.weightKey), // -> Favoris ?
          );
    });
  }

  final ApiHelper api;

  // TODO : Fonctions utiles
  void resetValues(AppStore store, AppStoreState state) {}

  void saveValue() {
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      // prefs.setDouble(AppConst.weightKey, state.weightKg);
    });
  }

  void getAllItem(){
    api.get().then((response){
      var blocks = response.data as List<dynamic>;

      final res = [];
      blocks.forEach((block){
        res.add(block(block["name"], block["nameSpaceId"], block["image"]));
      });

      state = state.copyWith(blocks : res);
    });
  }
}

class AppStoreState {
  //variables
  final List<Block> blocks;

  //constructeur
  AppStoreState({required this.blocks});

  factory AppStoreState.init() {
    return AppStoreState(blocks: []);
  }

  AppStoreState copyWith({blocks}) {
    return AppStoreState(blocks: blocks ?? this.blocks);
  }
}