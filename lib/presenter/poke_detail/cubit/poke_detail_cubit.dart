import 'package:bloc/bloc.dart';
import 'package:flutter_pokeapi/domain/model/poke_model.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';

part 'poke_detail_state.dart';

class PokeDetailCubit extends Cubit<PokeDetailState> {
  PokeDetailCubit(this._pokeRepository) : super(const PokeDetailState());

  final PokeRepository _pokeRepository;

  Future<void> getByName(String name) async {
    emit(state.copyWith(status: DetailStatus.loading));
    try {
      final pokeDetail = await _pokeRepository.getDetail(name);
      emit(state.copyWith(
        status: DetailStatus.success,
        pokeDetailModel: pokeDetail,
      ));
    } catch (e) {
      emit(state.copyWith(status: DetailStatus.failure));
    }
  }
}
