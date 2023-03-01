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
          appBarTheme: AppBarTheme(color: Colors.redAccent.shade700),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.amber.shade900,
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const PokeListPage(),
      ),
    );
  }
}
