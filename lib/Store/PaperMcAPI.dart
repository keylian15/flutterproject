import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MinecraftStore with ChangeNotifier {
  List<dynamic> items = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchMinecraftData() async {
    final url = Uri.parse("https://raw.githubusercontent.com/PrismarineJS/minecraft-data/master/data/pc/1.20/items.json");

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
