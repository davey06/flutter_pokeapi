import 'package:flutter/material.dart';

enum PokeTypes {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown
}

extension PokeTypeConverter on String {
  PokeTypes toPokeType() {
    if (toLowerCase() == PokeTypes.normal.name) {
      return PokeTypes.normal;
    }
    if (toLowerCase() == PokeTypes.fighting.name) {
      return PokeTypes.fighting;
    }
    if (toLowerCase() == PokeTypes.flying.name) {
      return PokeTypes.flying;
    }
    if (toLowerCase() == PokeTypes.poison.name) {
      return PokeTypes.poison;
    }
    if (toLowerCase() == PokeTypes.ground.name) {
      return PokeTypes.ground;
    }
    if (toLowerCase() == PokeTypes.rock.name) {
      return PokeTypes.rock;
    }
    if (toLowerCase() == PokeTypes.bug.name) {
      return PokeTypes.bug;
    }
    if (toLowerCase() == PokeTypes.ghost.name) {
      return PokeTypes.ghost;
    }
    if (toLowerCase() == PokeTypes.steel.name) {
      return PokeTypes.steel;
    }
    if (toLowerCase() == PokeTypes.fire.name) {
      return PokeTypes.fire;
    }
    if (toLowerCase() == PokeTypes.water.name) {
      return PokeTypes.water;
    }
    if (toLowerCase() == PokeTypes.grass.name) {
      return PokeTypes.grass;
    }
    if (toLowerCase() == PokeTypes.electric.name) {
      return PokeTypes.electric;
    }
    if (toLowerCase() == PokeTypes.psychic.name) {
      return PokeTypes.psychic;
    }
    if (toLowerCase() == PokeTypes.ice.name) {
      return PokeTypes.ice;
    }
    if (toLowerCase() == PokeTypes.dragon.name) {
      return PokeTypes.dragon;
    }
    if (toLowerCase() == PokeTypes.dark.name) {
      return PokeTypes.dark;
    }
    if (toLowerCase() == PokeTypes.fairy.name) {
      return PokeTypes.fairy;
    }
    return PokeTypes.unknown;
  }
}

extension PokeTypeColor on PokeTypes {
  Color getColor() {
    switch (this) {
      case PokeTypes.normal:
        return Colors.lime.shade900;
      case PokeTypes.fighting:
        return Colors.redAccent;
      case PokeTypes.flying:
        return Colors.deepPurpleAccent;
      case PokeTypes.poison:
        return Colors.purple;
      case PokeTypes.ground:
        return Colors.brown.shade300;
      case PokeTypes.rock:
        return Colors.brown;
      case PokeTypes.bug:
        return Colors.lightGreen;
      case PokeTypes.ghost:
        return Colors.deepPurple;
      case PokeTypes.steel:
        return Colors.blueGrey;
      case PokeTypes.fire:
        return Colors.deepOrange;
      case PokeTypes.water:
        return Colors.blue;
      case PokeTypes.grass:
        return Colors.green;
      case PokeTypes.electric:
        return Colors.yellow;
      case PokeTypes.psychic:
        return Colors.pink;
      case PokeTypes.ice:
        return Colors.lightBlueAccent;
      case PokeTypes.dragon:
        return Colors.purple.shade900;
      case PokeTypes.dark:
        return Colors.brown.shade900;
      case PokeTypes.fairy:
        return Colors.pinkAccent.shade100;
      case PokeTypes.unknown:
        return Colors.green.shade800;
    }
  }
}
