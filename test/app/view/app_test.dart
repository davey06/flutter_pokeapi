import 'package:flutter_pokeapi/app/app.dart';
import 'package:flutter_pokeapi/presenter/poke_list/view/poke_list_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(PokeListPage), findsOneWidget);
    });
  });
}
