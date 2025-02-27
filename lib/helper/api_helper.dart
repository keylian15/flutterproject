// Le but : Centraliser les appels a l'api
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../widget/dioProvider.dart';

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
}
