import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokeapi/domain/model/poke_model.dart';
import 'package:flutter_pokeapi/domain/model/poke_type_enum.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:flutter_pokeapi/presenter/extension/string_extension.dart';
import 'package:flutter_pokeapi/presenter/poke_detail/cubit/poke_detail_cubit.dart';
import 'package:flutter_pokeapi/presenter/widgets/colored_container.dart';
import 'package:flutter_pokeapi/presenter/widgets/failure_with_retry_view.dart';
import 'package:flutter_pokeapi/presenter/widgets/types_colored_container.dart';

class PokeDetailPage extends StatelessWidget {
  const PokeDetailPage({required this.pokeName, super.key});
  final String pokeName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PokeDetailCubit(context.read<PokeRepository>())..getByName(pokeName),
      child: PokeDetailView(pokeName),
    );
  }
}

class PokeDetailView extends StatelessWidget {
  const PokeDetailView(this.pokeName, {super.key});
  final String pokeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokeDetailCubit, PokeDetailState>(
          builder: (context, state) {
        switch (state.status) {
          case DetailStatus.initial:
          case DetailStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case DetailStatus.success:
            return SuccessView(state.pokeDetailModel);
          case DetailStatus.failure:
            return FailureWithRetryView(retryFunction: () {
              context.read<PokeDetailCubit>().getByName(pokeName);
            });
        }
      }),
    );
  }
}

class SuccessView extends StatelessWidget {
  const SuccessView(this.model, {super.key});
  final PokeDetailModel? model;

  @override
  Widget build(BuildContext context) {
    final pokeModel = model;
    return Scaffold(
      appBar: AppBar(
        title: pokeModel == null
            ? null
            : PokeNameWidget(
                id: pokeModel.id,
                name: pokeModel.name.toUpperCase(),
              ),
        backgroundColor: model?.types.first.getColor(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: pokeModel == null
            ? const Center(child: Text('Poke not Found'))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(pokeModel.artworkUrl, fit: BoxFit.cover),
                  const SizedBox(height: 12),
                  TypeWidget(pokeModel.types),
                  const SizedBox(height: 12),
                  AbilitiesWidget(
                    pokeModel.abilities,
                    bgColor: pokeModel.types.first.getColor(),
                  ),
                ],
              ),
      ),
    );
  }
}

class PokeNameWidget extends StatelessWidget {
  const PokeNameWidget({
    required this.id,
    required this.name,
    super.key,
  });
  final int id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('#$id'),
        const SizedBox(width: 4),
        Text(name.toTitleCase()),
      ],
    );
  }
}

class TypeWidget extends StatelessWidget {
  const TypeWidget(this.types, {super.key});
  final List<PokeTypes> types;

  @override
  Widget build(BuildContext context) {
    return ColoredContainer(
      label: 'Type :',
      bgColor: types.first.getColor(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: types.map(TypesColoredContainer.new).toList(),
      ),
    );
  }
}

class AbilitiesWidget extends StatelessWidget {
  const AbilitiesWidget(this.abilities, {required this.bgColor, super.key});
  final List<String> abilities;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return ColoredContainer(
      label: 'Ability :',
      bgColor: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            abilities.map((ability) => Text(ability.toTitleCase())).toList(),
      ),
    );
  }
}
