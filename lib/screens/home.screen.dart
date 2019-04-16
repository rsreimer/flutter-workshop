import 'package:flutter/widgets.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/widgets/pokemon-grid-item.widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Pokemon> pokemons;

  HomeScreen({this.pokemons});

  @override
  Widget build(BuildContext context) {
    // Map each pokémon to a PokemonGridItem.
    List<Widget> list = pokemons.map((p) => PokemonGridItem(pokemon: p)).toList();

    return GridView.count(
      // Use the list of PokemonGridItems to show in the grid.
      children: list,
      crossAxisCount: 2,
    );
  }
}
