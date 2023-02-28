import 'package:freezed_annotation/freezed_annotation.dart';

part 'poke_model.freezed.dart';
part 'poke_model.g.dart';

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
    required List<String> type,
    required String artworkUrl,
  }) = _PokeDetailModel;

  factory PokeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokeDetailModelFromJson(json);
}
