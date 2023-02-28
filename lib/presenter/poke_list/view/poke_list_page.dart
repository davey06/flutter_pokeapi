import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokeapi/domain/model/poke_model.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:flutter_pokeapi/presenter/poke_list/poke_list_cubit/poke_list_cubit.dart';
import 'package:flutter_pokeapi/presenter/widgets/failure_with_retry_view.dart';

class PokeListPage extends StatelessWidget {
  const PokeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PokeListCubit(context.read<PokeRepository>())..getFirstPage(),
      child: const PokeListView(),
    );
  }
}

class PokeListView extends StatelessWidget {
  const PokeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke Api Dex'),
      ),
      body: BlocBuilder<PokeListCubit, PokeListState>(
        builder: (context, state) {
          switch (state.status) {
            case ListStatus.initial:
            case ListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ListStatus.success:
              return PokeListWidget(state.pokeListModel);
            case ListStatus.failure:
              return FailureWithRetryView(retryFunction: () {
                context.read<PokeListCubit>().getFirstPage();
              });
          }
        },
      ),
    );
  }
}

class PokeListWidget extends StatelessWidget {
  const PokeListWidget(this.pokeList, {super.key});
  final List<PokeListModel> pokeList;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<PokeListCubit>().getFirstPage();
      },
      child: ListView.separated(
        itemBuilder: (context, index) {
          final poke = pokeList[index];
          return ListTile(
            title: Text(poke.name),
            onTap: () {
              // Todo: Open Detail
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: pokeList.length,
      ),
    );
  }
}
