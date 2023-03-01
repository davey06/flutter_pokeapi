import 'package:flutter_pokeapi/domain/model/poke_type_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poke_model.freezed.dart';
part 'poke_model.g.dart';

@freezed
class PokePagination with _$PokePagination {
  const factory PokePagination({
    required String? next,
    required String? previous,
    required List<PokeListModel> results,
  }) = _PokePagination;

  factory PokePagination.fromJson(Map<String, dynamic> json) =>
      _$PokePaginationFromJson(json);
}

@freezed
class PokeListModel with _$PokeListModel {
  const factory PokeListModel({
    required String name,
    required String url,
  }) = _PokeListModel;

  factory PokeListModel.fromJson(Map<String, dynamic> json) =>
      _$PokeListModelFromJson(json);
}

@freezed
class PokeDetailModel with _$PokeDetailModel {
  const factory PokeDetailModel({
    required int id,
    required String name,
    required List<String> abilities,
    required List<PokeTypes> types,
    required String artworkUrl,
  }) = _PokeDetailModel;

  const PokeDetailModel._();

  factory PokeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokeDetailModelFromJson(json);

  factory PokeDetailModel.fromCustomJson(Map<String, dynamic> json) {
    final abilities = (json['abilities'] as List<dynamic>)
        .map((e) => (e as Map<String, dynamic>)['ability']['name'].toString())
        .toList();
    final types = (json['types'] as List<dynamic>)
        .map((e) =>
            (e as Map<String, dynamic>)['type']['name'].toString().toPokeType())
        .toList();

    return PokeDetailModel(
      id: json['id'] as int,
      name: json['name'].toString(),
      abilities: abilities,
      types: types,
      artworkUrl: json['sprites']['other']['official-artwork']['front_default']
          as String,
    );
  }
}
