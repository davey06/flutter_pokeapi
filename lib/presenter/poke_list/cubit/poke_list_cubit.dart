import 'package:bloc/bloc.dart';
import 'package:flutter_pokeapi/domain/model/poke_model.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';

part 'poke_list_state.dart';

class PokeListCubit extends Cubit<PokeListState> {
  PokeListCubit(this._pokeRepository) : super(const PokeListState());

  final PokeRepository _pokeRepository;

  int currentPage = 0;

  Future<void> getNextPage() async {
    currentPage++;
    try {
      final pokeList = await _pokeRepository.getListPaging(page: currentPage);
      final list = [...state.pokeListModel, ...pokeList];
      emit(
        state.copyWith(
          status: ListStatus.success,
          pokeListModel: list,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ListStatus.failure));
    }
  }

  Future<void> getFirstPage() async {
    currentPage = 0;
    try {
      final pokeList = await _pokeRepository.getListPaging(page: currentPage);
      emit(
        state.copyWith(
          status: ListStatus.success,
          pokeListModel: pokeList,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ListStatus.failure));
    }
  }
}
