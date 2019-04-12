import 'package:flutter/widgets.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/widgets/grid-item.widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Pokemon> pokemons;

  HomeScreen({this.pokemons});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = pokemons.map((p) => GridItem(pokemon: p)).toList();

    return GridView.count(
      children: list,
      crossAxisCount: 2,
    );
  }
}
