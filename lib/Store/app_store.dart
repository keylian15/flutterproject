import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutterproject/helper/api_helper.dart';
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
}

class AppStoreState {
  //variables

  //constructeur
  AppStoreState();

  factory AppStoreState.init() {
    return AppStoreState();
  }

  AppStoreState copyWith({double? weightKg, double? heightCm}) {
    return AppStoreState(
        // weightKg: weightKg ?? this.weightKg,
        );
  }
}

class MinecraftStore with ChangeNotifier {
  List<dynamic> items = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchMinecraftData() async {
    final url = Uri.parse(
        "https://raw.githubusercontent.com/PrismarineJS/minecraft-data/master/data/pc/1.18/items.json");

    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      print("🔄 Envoi de la requête à l'API...");
      final response = await http.get(url);

      print("📥 Réponse reçue. Code HTTP: ${response.statusCode}");
      if (response.statusCode == 200) {
        print("✅ JSON chargé avec succès.");
        List<dynamic> data = jsonDecode(response.body);

        if (data.isEmpty) {
          throw Exception("Le JSON est vide !");
        }

        items = data;
      } else {
        throw Exception("Erreur HTTP ${response.statusCode}");
      }
    } catch (e) {
      errorMessage = "Erreur : ${e.toString()}";
      print("❌ Erreur lors du chargement des données : $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
