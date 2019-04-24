import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/widgets/badge.widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsScreen extends StatelessWidget {
  final Pokemon pokemon;
  final TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 18);

  DetailsScreen({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pokemon.name.toString()),
        backgroundColor: Colors.blueGrey[500],
      ),
      body: Container(
        color: Colors.blueGrey[700],
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.blueGrey,
            ),
            // MediaQueries can be used to get the screen width/height.
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Hero(
                    child: CachedNetworkImage(imageUrl: pokemon.image),
                    tag: pokemon.number),
                Text(
                  pokemon.name.toString(),
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PokeBadge(
                      title: 'Height:',
                      text: pokemon.height,
                    ),
                    PokeBadge(
                      title: 'Weight:',
                      text: pokemon.weight,
                    )
                  ],
                ),
                Text('Types', style: headerStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.type
                      .map((type) => PokeBadge(
                            text: type,
                            color: Colors.green,
                          ))
                      .toList(),
                ),
                Text('Weaknesses', style: headerStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.weaknesses
                      .map((weakness) =>
                          PokeBadge(text: weakness, color: Colors.red))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
