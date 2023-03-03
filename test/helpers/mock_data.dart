import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_pokeapi/data/remote/poke_api.dart';
import 'package:flutter_pokeapi/domain/model/poke_model.dart';
import 'package:flutter_pokeapi/domain/model/poke_type_enum.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:flutter_pokeapi/presenter/poke_detail/cubit/poke_detail_cubit.dart';
import 'package:flutter_pokeapi/presenter/poke_list/cubit/poke_list_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockPokeApiRemote extends Mock implements PokeApiRemote {}

class MockPokeRepository extends Mock implements PokeRepository {}

class MockPokeListCubit extends MockCubit<PokeListState>
    implements PokeListCubit {}

class MockPokeDetailCubit extends MockCubit<PokeDetailState>
    implements PokeDetailCubit {}

class FakePokeListModel extends Fake implements PokeListModel {
  static List<PokeListModel> data = List.generate(
    10,
    (index) => PokeListModel(name: 'name$index', url: 'url$index'),
  );
}

class FakePokeDetailModel extends Fake implements PokeDetailModel {
  static const data = PokeDetailModel(
    id: 123,
    name: 'bulba',
    abilities: ['mock-ability1', 'mock-ability2'],
    types: [PokeTypes.normal, PokeTypes.ice],
    artworkUrl: 'artworkUrl',
  );
}
