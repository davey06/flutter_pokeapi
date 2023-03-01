// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokePagination _$$_PokePaginationFromJson(Map<String, dynamic> json) =>
    _$_PokePagination(
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokeListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PokePaginationToJson(_$_PokePagination instance) =>
    <String, dynamic>{
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$_PokeListModel _$$_PokeListModelFromJson(Map<String, dynamic> json) =>
    _$_PokeListModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_PokeListModelToJson(_$_PokeListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$_PokeDetailModel _$$_PokeDetailModelFromJson(Map<String, dynamic> json) =>
    _$_PokeDetailModel(
      id: json['id'] as int,
      name: json['name'] as String,
      abilities:
          (json['abilities'] as List<dynamic>).map((e) => e as String).toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => $enumDecode(_$PokeTypesEnumMap, e))
          .toList(),
      artworkUrl: json['artworkUrl'] as String,
    );

Map<String, dynamic> _$$_PokeDetailModelToJson(_$_PokeDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abilities': instance.abilities,
      'types': instance.types.map((e) => _$PokeTypesEnumMap[e]!).toList(),
      'artworkUrl': instance.artworkUrl,
    };

const _$PokeTypesEnumMap = {
  PokeTypes.normal: 'normal',
  PokeTypes.fighting: 'fighting',
  PokeTypes.flying: 'flying',
  PokeTypes.poison: 'poison',
  PokeTypes.ground: 'ground',
  PokeTypes.rock: 'rock',
  PokeTypes.bug: 'bug',
  PokeTypes.ghost: 'ghost',
  PokeTypes.steel: 'steel',
  PokeTypes.fire: 'fire',
  PokeTypes.water: 'water',
  PokeTypes.grass: 'grass',
  PokeTypes.electric: 'electric',
  PokeTypes.psychic: 'psychic',
  PokeTypes.ice: 'ice',
  PokeTypes.dragon: 'dragon',
  PokeTypes.dark: 'dark',
  PokeTypes.fairy: 'fairy',
  PokeTypes.unknown: 'unknown',
};
