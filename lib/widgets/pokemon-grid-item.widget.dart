import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/providers/pokemon-storage-system.dart';
import 'package:pokedex/screens/details.screen.dart';
import 'package:pokedex/widgets/pokeball.widget.dart';
import 'package:provider/provider.dart';

class PokemonGridItem extends StatelessWidget {
  final Pokemon pokemon;

  PokemonGridItem({this.pokemon});

  @override
  Widget build(BuildContext context) {
    final storageSystem = Provider.of<PokemonStorageSystem>(context);

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => DetailsScreen(pokemon: pokemon),
        ),
      ),
      onLongPress: () {
        if (storageSystem.containsPokemon(pokemon)) {
          storageSystem.removePokemon(pokemon);
        } else {
          storageSystem.addPokemon(pokemon);
        }
      },
      child: Column(
        children: <Widget>[
          Pokeball(pokemon),
          Text(
            pokemon.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            pokemon.number,
            style: TextStyle(color: Colors.blueGrey[200]),
          ),
        ],
      ),
    );
  }
}
