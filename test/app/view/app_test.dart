import 'package:flutter_pokeapi/app/app.dart';
import 'package:flutter_pokeapi/presenter/poke_list/view/poke_list_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('App', () {
    testWidgets('renders Poke Api Dex', (tester) async {
      await tester.pumpWidget(App(MockPokeRepository()));
      expect(find.byType(PokeListPage), findsOneWidget);
    });
  });
}
