import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:flutter_pokeapi/l10n/l10n.dart';
import 'package:flutter_pokeapi/presenter/poke_list/view/poke_list_page.dart';

class App extends StatelessWidget {
  const App(this._pokeRepository, {super.key});

  final PokeRepository _pokeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _pokeRepository,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const PokeListPage(),
      ),
    );
  }
}
