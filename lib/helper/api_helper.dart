// Le but : Centraliser les appels a l'api
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../widget/dioProvider.dart';
import '../models/recipe_model.dart';

final apiHelperProvider = Provider<ApiHelper>((ref) {
  var dio = ref.watch(dioProvider);
  return ApiHelper(dio: dio);
});

class ApiHelper {
  ApiHelper({required this.dio});

  final Dio dio;

  Future<Response> get() {
    final url = 'https://raw.githubusercontent.com/anish-shanbhag/minecraft-api/refs/heads/master/data/blocks.json';
    return dio.get(url);
  }

  Future<Response> getItems() {
    final url = 'https://raw.githubusercontent.com/anish-shanbhag/minecraft-api/refs/heads/master/data/items.json';
    return dio.get(url);
  }

  Future<List<Recipe>> getCrafting() async {
    try {
      final url = 'https://raw.githubusercontent.com/anish-shanbhag/minecraft-api/master/data/recipes.json';
      final response = await dio.get(url);
      
      if (response.statusCode == 200) {
        // Assurons-nous que nous avons une liste de recettes
        String responseData = response.data.toString();
        List<dynamic> jsonData = json.decode(responseData);
        
        print("Données brutes reçues: ${jsonData.length} recettes");
        
        final recipes = jsonData.map((item) {
          try {
            return Recipe.fromJson(item);
          } catch (e) {
            print("Erreur parsing recette: $e");
            return null;
          }
        }).where((recipe) => recipe != null).cast<Recipe>().toList();
        
        print("Recettes parsées avec succès: ${recipes.length}");
        return recipes;
      }
      
      throw Exception('Erreur HTTP: ${response.statusCode}');
    } catch (e) {
      print('Erreur détaillée API crafting: $e');
      return [];
    }
  }

  Future<bool> checkImageExists(String path) async {
    try {
      final response = await dio.head(path);
      return response.statusCode == 200;
    } catch (e) {
      print('Erreur vérification image: $e');
      return false;
    }
  }

  // Ajout d'une méthode pour vérifier l'existence d'une image dans les deux dossiers
  Future<String> getImageUrl(String itemName) async {
    final formattedName = itemName.toLowerCase().replaceAll(' ', '_');
    final baseUrl = 'https://raw.githubusercontent.com/anish-shanbhag/minecraft-api/master/public/images';
    
    // Vérifier d'abord dans blocks
    if (await checkImageExists('$baseUrl/blocks/$formattedName.png')) {
      return '$baseUrl/blocks/$formattedName.png';
    }
    
    // Sinon retourner le chemin items
    return '$baseUrl/items/$formattedName.png';
  }
}
