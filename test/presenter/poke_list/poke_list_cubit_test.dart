import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:flutter_pokeapi/presenter/poke_list/cubit/poke_list_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Poke Detail Cubit', () {
    late PokeRepository pokeRepository;
    late PokeListCubit pokeListCubit;
    setUp(() {
      pokeRepository = MockPokeRepository();
      pokeListCubit = PokeListCubit(pokeRepository);
    });

    test('initial state', () {
      expect(
        pokeListCubit.state,
        equals(const PokeListState()),
      );
    });

    test('get first page', () async {
      final mockPokeListModel = [FakePokeListModel()];
      when(() => pokeRepository.getListPaging())
          .thenAnswer((_) => Future.value(mockPokeListModel));

      await pokeListCubit.getFirstPage();
      verify(
        () => pokeRepository.getListPaging(),
      ).called(1);

      expect(
        pokeListCubit.state,
        equals(
          isA<PokeListState>()
              .having((w) => w.status, 'status', ListStatus.success)
              .having(
                  (w) => w.pokeListModel, 'pokeListModel', mockPokeListModel),
        ),
      );
      expect(pokeListCubit.currentPage, equals(0));
    });

    test('get next page', () async {
      final mockPokeListModel = [FakePokeListModel()];
      when(() => pokeRepository.getListPaging(page: 1))
          .thenAnswer((_) => Future.value(mockPokeListModel));

      await pokeListCubit.getNextPage();
      verify(
        () => pokeRepository.getListPaging(page: 1),
      ).called(1);

      expect(pokeListCubit.currentPage, equals(1));
      expect(
        pokeListCubit.state,
        equals(
          isA<PokeListState>()
              .having((w) => w.status, 'status', ListStatus.success)
              .having(
                  (w) => w.pokeListModel, 'pokeListModel', mockPokeListModel),
        ),
      );
    });
  });
}
