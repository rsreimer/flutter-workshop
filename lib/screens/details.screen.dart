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
        padding: EdgeInsets.symmetric(vertical: 16.0),
        color: Colors.blueGrey[700],
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.blueGrey,
            ),
            // MediaQueries can be used to get the screen width/height.
            width: MediaQuery.of(context).size.width * 0.8,
            child: ListView(
              shrinkWrap: true,
              children: [
                Hero(
                    child: CachedNetworkImage(imageUrl: pokemon.image, height: 100,),
                    tag: pokemon.number),
                Text(
                  pokemon.name.toString(),
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
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
                Text('Types', style: headerStyle, textAlign: TextAlign.center,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.type
                      .map((type) => PokeBadge(
                            text: type,
                            color: Colors.green,
                          ))
                      .toList(),
                ),
                Text('Weaknesses', style: headerStyle, textAlign: TextAlign.center,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.weaknesses
                      .map((weakness) =>
                          PokeBadge(text: weakness, color: Colors.red))
                      .toList(),
                ),
                _generateEvolutions("Previous Evolutions", pokemon.prevEvolution),
                _generateEvolutions("Next Evolutions", pokemon.nextEvolution)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _generateEvolutions(String name, List<Evolution> evolutions) {
    return Column(
      children: <Widget>[
        evolutions != null
            ? Column(
                children: <Widget>[
                  Text(
                    name,
                    style: headerStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: evolutions
                        .map(
                          (e) => Column(
                                children: <Widget>[
                                  CachedNetworkImage(imageUrl: 'http://www.serebii.net/pokemongo/pokemon/${e.number}.png', width: 50),
                                  Text(
                                    e.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                        )
                        .toList(),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
