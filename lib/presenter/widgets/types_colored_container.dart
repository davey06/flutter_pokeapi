import 'package:flutter/material.dart';
import 'package:flutter_pokeapi/domain/model/poke_type_enum.dart';

class TypesColoredContainer extends StatelessWidget {
  const TypesColoredContainer(this.type, {super.key});
  final PokeTypes type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: type.getColor(),
      ),
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        type.name,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
