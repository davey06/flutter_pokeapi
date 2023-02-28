part of 'poke_list_cubit.dart';

enum ListStatus { initial, loading, success, failure }

class PokeListState {
  const PokeListState({
    this.status = ListStatus.initial,
    this.pokeListModel = const [],
  });
  final List<PokeListModel> pokeListModel;
  final ListStatus status;

  PokeListState copyWith({
    ListStatus? status,
    List<PokeListModel>? pokeListModel,
  }) {
    return PokeListState(
      status: status ?? this.status,
      pokeListModel: pokeListModel ?? this.pokeListModel,
    );
  }
}
