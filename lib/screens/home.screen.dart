import 'package:flutter/widgets.dart';
import 'package:pokedex/models/pokemon.model.dart';

class HomeScreen extends StatelessWidget {
  final List<Pokemon> pokemons;

  HomeScreen({this.pokemons});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = pokemons.map((p) => Text(p.name)).toList();

    return Column(children: list);
  }
}
