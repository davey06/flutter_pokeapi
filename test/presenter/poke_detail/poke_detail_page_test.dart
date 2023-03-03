import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokeapi/domain/repository/poke_repository.dart';
import 'package:flutter_pokeapi/presenter/poke_detail/cubit/poke_detail_cubit.dart';
import 'package:flutter_pokeapi/presenter/poke_detail/view/poke_detail_page.dart';
import 'package:flutter_pokeapi/presenter/widgets/failure_with_retry_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Poke Detail Page', () {
    const mockName = 'bulba';
    late PokeRepository pokeRepository;

    setUp(() {
      pokeRepository = MockPokeRepository();
    });

    testWidgets('renders PokeDetailView', (tester) async {
      await mockNetworkImagesFor(() async => tester.pumpApp(
            const PokeDetailPage(pokeName: mockName),
            pokeRepository: pokeRepository,
          ));

      expect(find.byType(PokeDetailView), findsOneWidget);
    });
  });

  group('PokeDetailView', () {
    late PokeDetailCubit pokeDetailCubit;

    setUp(() {
      pokeDetailCubit = MockPokeDetailCubit();
    });

    testWidgets('renders loading for initial state', (tester) async {
      when(() => pokeDetailCubit.state).thenReturn(const PokeDetailState());
      await tester.pumpWidget(
        BlocProvider.value(
          value: pokeDetailCubit,
          child: MaterialApp(
            home: PokeDetailView(FakePokeDetailModel.data.name),
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders for success state', (tester) async {
      when(() => pokeDetailCubit.state).thenReturn(const PokeDetailState(
        status: DetailStatus.success,
        pokeDetailModel: FakePokeDetailModel.data,
      ));

      await mockNetworkImagesFor(() async => tester.pumpWidget(
            BlocProvider.value(
              value: pokeDetailCubit,
              child: MaterialApp(
                home: PokeDetailView(FakePokeDetailModel.data.name),
              ),
            ),
          ));

      expect(find.byType(SuccessView), findsOneWidget);
    });

    testWidgets('renders for failure state', (tester) async {
      when(() => pokeDetailCubit.state)
          .thenReturn(const PokeDetailState(status: DetailStatus.failure));
      await tester.pumpWidget(
        BlocProvider.value(
          value: pokeDetailCubit,
          child: MaterialApp(
            home: PokeDetailView(FakePokeDetailModel.data.name),
          ),
        ),
      );
      expect(find.byType(FailureWithRetryView), findsOneWidget);
    });
  });
}
