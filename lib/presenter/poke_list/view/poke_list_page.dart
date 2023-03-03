import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokeapi/domain/model/poke_model.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:flutter_pokeapi/presenter/extension/string_extension.dart';
import 'package:flutter_pokeapi/presenter/poke_detail/view/poke_detail_page.dart';
import 'package:flutter_pokeapi/presenter/poke_list/cubit/poke_list_cubit.dart';
import 'package:flutter_pokeapi/presenter/widgets/failure_with_retry_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

class PokeListWidget extends StatefulWidget {
  const PokeListWidget(this.pokeList, {super.key});
  final List<PokeListModel> pokeList;

  @override
  State<PokeListWidget> createState() => _PokeListWidgetState();
}

class _PokeListWidgetState extends State<PokeListWidget> {
  final refreshController = RefreshController();

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      onRefresh: () async {
        await context.read<PokeListCubit>().getFirstPage();
        refreshController.refreshCompleted();
      },
      enablePullUp: true,
      onLoading: () async {
        await context.read<PokeListCubit>().getNextPage();
        refreshController.loadComplete();
      },
      child: ListView.separated(
        itemBuilder: (context, index) {
          final poke = widget.pokeList[index];
          return ListTile(
            title: Text('#${index + 1} ${poke.name.toTitleCase()}'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (context) => PokeDetailPage(
                            pokeName: poke.name,
                          )));
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: widget.pokeList.length,
      ),
    );
  }
}
