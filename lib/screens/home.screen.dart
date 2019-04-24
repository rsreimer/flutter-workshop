import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/widgets/pokemon-grid-item.widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Pokemon> pokemons;

  HomeScreen({this.pokemons});

  @override
  Widget build(BuildContext context) {
    // Map each Pokémon to a PokemonGridItem
    List<Widget> list =
        pokemons.map((p) => PokemonGridItem(pokemon: p)).toList();

    // Show the list of PokemonGridItems in a grid
    return Container(
      color: Colors.blueGrey[700],
      child: GridView.count(
        children: list,
        crossAxisCount: 2,
      ),
    );
  }
}
