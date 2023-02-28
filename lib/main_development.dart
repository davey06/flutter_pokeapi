import 'package:flutter_pokeapi/app/app.dart';
import 'package:flutter_pokeapi/bootstrap.dart';

void main() {
  bootstrap(
    (_, pokeRepo) {
      return App(
        pokeRepo,
      );
    },
  );
}
