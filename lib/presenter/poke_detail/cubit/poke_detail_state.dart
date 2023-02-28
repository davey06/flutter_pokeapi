part of 'poke_detail_cubit.dart';

enum DetailStatus { initial, loading, success, failure }

class PokeDetailState {
  const PokeDetailState({
    this.status = DetailStatus.initial,
    this.pokeDetailModel,
  });
  final PokeDetailModel? pokeDetailModel;
  final DetailStatus status;

  PokeDetailState copyWith({
    DetailStatus? status,
    PokeDetailModel? pokeDetailModel,
  }) {
    return PokeDetailState(
      status: status ?? this.status,
      pokeDetailModel: pokeDetailModel ?? this.pokeDetailModel,
    );
  }
}
