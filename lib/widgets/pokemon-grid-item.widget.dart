import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/screens/details.screen.dart';

class PokemonGridItem extends StatefulWidget {
  final Pokemon pokemon;

  PokemonGridItem({this.pokemon});

  @override
  _PokemonGridItemState createState() => _PokemonGridItemState();
}

class _PokemonGridItemState extends State<PokemonGridItem> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DetailsScreen(pokemon: widget.pokemon),
            ),
          ),
      onLongPress: () => setState(
            () {
              favorite = !favorite;
            },
          ),
      child: Column(
        children: <Widget>[
          Container(
            child: Hero(
              child: CachedNetworkImage(imageUrl: widget.pokemon.image),
              tag: widget.pokemon.number,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueGrey[400],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              favorite
                  ? Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  : Container(),
              Text(
                widget.pokemon.name,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          Text(
            widget.pokemon.number,
            style: TextStyle(color: Colors.blueGrey[200]),
          ),
        ],
      ),
    );
  }
}
