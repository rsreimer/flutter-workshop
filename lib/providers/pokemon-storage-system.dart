import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:pokedex/models/pokemon.model.dart';

class PokemonStorageSystem extends ChangeNotifier {
  HashSet<String> _storedPokemon = new HashSet();

  void addPokemon(Pokemon pokemon) {
    _storedPokemon.add(pokemon.number);
    this.notifyListeners();
  }

  void removePokemon(Pokemon pokemon) {
    _storedPokemon.remove(pokemon.number);
    this.notifyListeners();
  }

  bool containsPokemon(Pokemon pokemon) {
    return _storedPokemon.contains(pokemon.number);
  }
}