import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/screens/details.screen.dart';

class PokemonGridItem extends StatelessWidget {
  final Pokemon pokemon;

  PokemonGridItem({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DetailsScreen(pokemon: pokemon),
            ),
          ),
      child: Column(
        children: <Widget>[
          Container(
            child: Hero(
              child: CachedNetworkImage(imageUrl: pokemon.image),
              tag: pokemon.number,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueGrey[400],
            ),
          ),
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
