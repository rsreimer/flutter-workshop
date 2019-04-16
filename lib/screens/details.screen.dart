import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';

class DetailsScreen extends StatelessWidget {
  final Pokemon pokemon;

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
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Hero(child: Image.network(pokemon.image), tag: pokemon.number),
                Text(
                  pokemon.name.toString(),
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
