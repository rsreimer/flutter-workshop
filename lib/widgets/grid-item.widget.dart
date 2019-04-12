import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/screens/details.screen.dart';

class GridItem extends StatelessWidget {
  final Pokemon pokemon;

  GridItem({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DetailsScreen(pokemon: pokemon),
            ),
          ),
      child: Container(
        color: Colors.blueGrey[700],
        child: Column(
          children: <Widget>[
            Container(
              child: Hero(
                child: Image.network(pokemon.img),
                tag: pokemon.id,
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[400],
                borderRadius: BorderRadius.circular(2000),
              ),
            ),
            Text(
              pokemon.name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "#" + pokemon.id.toString().padLeft(3, '0'),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
