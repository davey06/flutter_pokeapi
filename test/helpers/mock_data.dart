import 'package:flutter_pokeapi/data/remote/poke_api.dart';
import 'package:flutter_pokeapi/domain/model/poke_model.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockPokeApiRemote extends Mock implements PokeApiRemote {}

class MockPokeRepository extends Mock implements PokeRepository {}

class FakePokeListModel extends Fake implements PokeListModel {}

class FakePokeDetailModel extends Fake implements PokeDetailModel {}
