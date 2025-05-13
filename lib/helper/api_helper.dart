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

  Future<List<Recipe>> getCrafting() async {
    try {
      const testRecipes = [
        {
          "result": "Crafting_Table", // Correspond au nom exact du bloc
          "pattern": [
            "WW",
            "WW"
          ],
          "ingredients": {
            "W": "Oak_Planks" // Correspond au nom exact du bloc
          }
        },
        {
          "result": "Chest",
          "pattern": [
            "WWW",
            "W W",
            "WWW"
          ],
          "ingredients": {
            "W": "Oak_Planks"
          }
        }
      ];
      
      final recipes = testRecipes.map((item) => Recipe.fromJson(item)).toList();
      print("Recettes disponibles:");
      recipes.forEach((recipe) => print(" - ${recipe.result}"));
      return recipes;
    } catch (e) {
      print('Erreur API crafting: $e');
      return [];
    }
  }
}
