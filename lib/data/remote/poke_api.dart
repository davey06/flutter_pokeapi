import 'package:dio/dio.dart';
import 'package:flutter_pokeapi/domain/model/poke_model.dart';

class PokeApiRemote {
  static const _fetchLimit = 20;
  static const _baseUrl = 'https://pokeapi.co/api/v2';
  final dio = Dio();

  Future<List<PokeListModel>> getListPaging({int page = 0}) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
          '$_baseUrl/pokemon/?limit=$_fetchLimit&offset=${_fetchLimit * page}');
      final data = response.data;
      if (data != null) {
        final results = data['results'] as List<dynamic>;
        final listPoke = results
            .map((e) => PokeListModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return listPoke;
      }
      return [];
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<PokeDetailModel> getDetail(String name) async {
    try {
      final response =
          await dio.get<Map<String, dynamic>>('$_baseUrl/pokemon/$name');
      final data = response.data;
      if (data == null) {
        throw Exception('Poke Not Found');
      }
      return PokeDetailModel.fromCustomJson(data);
    } on DioError catch (e) {
      rethrow;
    }
  }
}
