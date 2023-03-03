import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:flutter_pokeapi/presenter/poke_list/cubit/poke_list_cubit.dart';
import 'package:flutter_pokeapi/presenter/poke_list/view/poke_list_page.dart';
import 'package:flutter_pokeapi/presenter/widgets/failure_with_retry_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Poke Detail Page', () {
    late PokeRepository pokeRepository;

    setUp(() {
      pokeRepository = MockPokeRepository();
    });

    testWidgets('renders PokeListView', (tester) async {
      await tester.pumpApp(
        const PokeListPage(),
        pokeRepository: pokeRepository,
      );

      expect(find.byType(PokeListView), findsOneWidget);
    });
  });

  group('PokeListView', () {
    late PokeListCubit pokeListCubit;

    setUp(() {
      pokeListCubit = MockPokeListCubit();
    });

    testWidgets('renders loading for initial state', (tester) async {
      when(() => pokeListCubit.state).thenReturn(const PokeListState());
      await tester.pumpWidget(
        BlocProvider.value(
          value: pokeListCubit,
          child: const MaterialApp(home: PokeListView()),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders WeatherPopulated for success state', (tester) async {
      when(() => pokeListCubit.state).thenReturn(PokeListState(
        status: ListStatus.success,
        pokeListModel: FakePokeListModel.data,
      ));

      await tester.pumpWidget(
        BlocProvider.value(
          value: pokeListCubit,
          child: const MaterialApp(home: PokeListView()),
        ),
      );

      expect(find.byType(PokeListWidget), findsOneWidget);
    });

    testWidgets('renders WeatherPopulated for failure state', (tester) async {
      when(() => pokeListCubit.state)
          .thenReturn(const PokeListState(status: ListStatus.failure));
      await tester.pumpWidget(
        BlocProvider.value(
          value: pokeListCubit,
          child: const MaterialApp(home: PokeListView()),
        ),
      );
      expect(find.byType(FailureWithRetryView), findsOneWidget);
    });
  });
}
