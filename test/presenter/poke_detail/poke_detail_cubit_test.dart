import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:flutter_pokeapi/presenter/poke_detail/cubit/poke_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Poke Detail Cubit', () {
    late PokeRepository pokeRepository;
    late PokeDetailCubit pokeDetailCubit;
    setUp(() {
      pokeRepository = MockPokeRepository();
      pokeDetailCubit = PokeDetailCubit(pokeRepository);
    });

    test('initial state', () {
      expect(
        pokeDetailCubit.state,
        equals(const PokeDetailState()),
      );
    });

    test('get detail by name', () async {
      const mockName = 'bulba';
      final pokeDetailModel = FakePokeDetailModel();
      when(() => pokeRepository.getDetail(mockName))
          .thenAnswer((_) => Future.value(pokeDetailModel));

      await pokeDetailCubit.getByName(mockName);
      verify(
        () => pokeRepository.getDetail(mockName),
      ).called(1);

      expect(
        pokeDetailCubit.state,
        equals(
          isA<PokeDetailState>()
              .having((w) => w.status, 'status', DetailStatus.success)
              .having(
                  (w) => w.pokeDetailModel, 'pokeDetailModel', pokeDetailModel),
        ),
      );
    });
  });
}
