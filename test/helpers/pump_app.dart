import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:flutter_pokeapi/l10n/l10n.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_data.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    PokeRepository? pokeRepository,
  }) {
    return pumpWidget(
      RepositoryProvider.value(
        value: pokeRepository ?? MockPokeRepository(),
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: widget,
        ),
      ),
    );
  }
}
