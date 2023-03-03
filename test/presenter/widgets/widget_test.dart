// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_pokeapi/domain/model/poke_type_enum.dart';
import 'package:flutter_pokeapi/presenter/widgets/colored_container.dart';
import 'package:flutter_pokeapi/presenter/widgets/failure_with_retry_view.dart';
import 'package:flutter_pokeapi/presenter/widgets/types_colored_container.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('ColoredContainer', () {
    testWidgets('renders child', (tester) async {
      await tester.pumpApp(ColoredContainer(
          label: 'label', bgColor: Colors.white70, child: FlutterLogo()));
      expect(find.byType(ColoredContainer), findsOneWidget);
    });
  });

  group('FailureWithRetryView', () {
    testWidgets('renders child', (tester) async {
      await tester.pumpApp(FailureWithRetryView(retryFunction: () {}));
      expect(find.byType(FailureWithRetryView), findsOneWidget);
    });
  });

  group('TypesColoredContainer', () {
    testWidgets('renders child', (tester) async {
      await tester.pumpApp(TypesColoredContainer(PokeTypes.unknown));
      expect(find.byType(TypesColoredContainer), findsOneWidget);
    });
  });
}
