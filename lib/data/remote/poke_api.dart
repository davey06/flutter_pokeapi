import 'package:dio/dio.dart';
import 'package:flutter_pokeapi/domain/model/poke_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'poke_api.g.dart';

class PokeApiRemote {
  PokeApiRemote();
  static const _fetchLimit = 20;
  final _apiService = PokeApiService(Dio());

  Future<List<PokeListModel>> getListPaging({int page = 0}) async {
    final paginationResult =
        await _apiService.getListPaging(_fetchLimit, _fetchLimit * page);

    return paginationResult.results;
  }

  Future<PokeDetailModel> getDetail(String name) => _apiService.getDetail(name);
}

@RestApi(baseUrl: 'https://pokeapi.co/api/v2/')
abstract class PokeApiService {
  factory PokeApiService(Dio dio) = _PokeApiService;

  @GET('/pokemon/?limit={limit}&offset={offset}')
  @JsonKey(name: 'results')
  Future<PokePagination> getListPaging(
    @Path() int limit,
    int offset,
  );

  @GET('/pokemon/{name}')
  Future<PokeDetailModel> getDetail(@Path() String name);
}
