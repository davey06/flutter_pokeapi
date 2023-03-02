import 'package:flutter_pokeapi/domain/model/poke_model.dart';
import 'package:flutter_pokeapi/domain/model/poke_type_enum.dart';
import 'package:test/test.dart';

void main() {
  group('PokeModel', () {
    group('PokePagination fromJson', () {
      test('returns correct model', () {
        const mockResult = [
          {'name': 'mockName', 'url': 'mockUrl'}
        ];
        final mockJson = {
          'next': 'next',
          'previous': 'prev',
          'results': mockResult,
        };
        expect(
          PokePagination.fromJson(mockJson),
          isA<PokePagination>().having(
            (w) => w.results,
            'results',
            [const PokeListModel(name: 'mockName', url: 'mockUrl')],
          ),
        );
      });
    });

    group('PokeListModel fromJson', () {
      test('returns correct model', () {
        const mockName = 'Bulbasor';
        const mockUrl = 'poke-url';
        const mockJson = {'name': mockName, 'url': mockUrl};
        expect(
          PokeListModel.fromJson(mockJson),
          isA<PokeListModel>()
              .having((w) => w.name, 'name', mockName)
              .having((w) => w.url, 'url', mockUrl),
        );
      });
    });

    group('PokeDetailModel', () {
      group('fromJson', () {
        test('returns correct model', () {
          final mockJson = {
            'id': 123,
            'name': 'Bulba',
            'abilities': ['abilities'],
            'types': ['normal'],
            'artworkUrl': 'artworkUrl',
          };
          expect(
            PokeDetailModel.fromJson(mockJson),
            isA<PokeDetailModel>()
                .having((w) => w.id, 'id', 123)
                .having((w) => w.name, 'name', 'Bulba')
                .having((w) => w.abilities, 'abilities', ['abilities']).having(
              (w) => w.types,
              'types',
              [PokeTypes.normal],
            ).having((w) => w.artworkUrl, 'artworkUrl', 'artworkUrl'),
          );
        });
      });

      group('fromCustomJson', () {
        test('returns correct model', () {
          final mockJson = {
            'id': 123,
            'name': 'Bulba',
            'abilities': [
              {
                'ability': {'name': 'ability-name'}
              }
            ],
            'types': [
              {
                'type': {'name': 'normal'}
              },
              {
                'type': {'name': 'ice'}
              }
            ],
            'sprites': {
              'other': {
                'official-artwork': {'front_default': 'artworkUrl'}
              }
            },
          };
          expect(
            PokeDetailModel.fromCustomJson(mockJson),
            isA<PokeDetailModel>()
                .having((w) => w.id, 'id', 123)
                .having((w) => w.name, 'name', 'Bulba')
                .having(
              (w) => w.abilities,
              'abilities',
              ['ability-name'],
            ).having(
              (w) => w.types,
              'types',
              [PokeTypes.normal, PokeTypes.ice],
            ).having((w) => w.artworkUrl, 'artworkUrl', 'artworkUrl'),
          );
        });
      });
    });
  });
}
