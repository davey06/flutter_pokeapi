// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      artworkUrl: json['artworkUrl'] as String,
    );

Map<String, dynamic> _$$_PokeDetailModelToJson(_$_PokeDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abilities': instance.abilities,
      'type': instance.type,
      'artworkUrl': instance.artworkUrl,
    };
