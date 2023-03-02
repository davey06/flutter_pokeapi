import 'package:flutter_pokeapi/data/remote/poke_api.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('PokeRepository', () {
    late PokeApiRemote pokeApiRemote;
    late PokeRepository pokeRepository;

    setUp(() {
      pokeApiRemote = MockPokeApiRemote();
      pokeRepository = PokeRepository(pokeApiRemote);
    });

    test('can be instantiated without any arguments', () {
      expect(pokeRepository, isNotNull);
    });

    group('getListPaging', () {
      test('get list of PokeListModel', () {
        when(
          () => pokeApiRemote.getListPaging(),
        ).thenAnswer((_) async => [FakePokeListModel()]);

        expect(
          pokeRepository.getListPaging(),
          completes,
        );

        verify(
          () => pokeApiRemote.getListPaging(),
        ).called(1);
      });
    });

    group('getDetail', () {
      const mockName = 'bulbasaur';
      test('get list of PokeListModel with name', () {
        when(
          () => pokeApiRemote.getDetail(mockName),
        ).thenAnswer((_) async => FakePokeDetailModel());

        expect(
          pokeRepository.getDetail(mockName),
          completes,
        );

        verify(
          () => pokeApiRemote.getDetail(mockName),
        ).called(1);
      });
    });
  });
}
