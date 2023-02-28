import 'package:flutter_pokeapi/data/remote/poke_api.dart';
import 'package:flutter_pokeapi/domain/model/poke_model.dart';

class PokeRepository {
  const PokeRepository(this._pokeApiRemote);
  final PokeApiRemote _pokeApiRemote;

  Future<List<PokeListModel>> getListPaging({int page = 0}) =>
      _pokeApiRemote.getListPaging(page: page);

  Future<PokeDetailModel> getDetail(String name) =>
      _pokeApiRemote.getDetail(name);
}
