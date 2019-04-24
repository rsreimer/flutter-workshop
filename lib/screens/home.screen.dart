import 'package:flutter/widgets.dart';
import 'package:pokedex/models/pokemon.model.dart';

class HomeScreen extends StatelessWidget {
  final List<Pokemon> pokemons;

  HomeScreen({this.pokemons});

  @override
  Widget build(BuildContext context) {
    // Map the list of Pokémons to a list of Text widgets
    List<Widget> list = pokemons.map((p) => Text(p.name)).toList();

    // Show the Text widgets in a Column widget
    return Column(children: list);
  }
}
