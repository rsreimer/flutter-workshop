import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/screens/home.screen.dart';
import 'package:http/http.dart';

void main() => runApp(Pokedex());

class Pokedex extends StatelessWidget {
  // Client is used for HTTP requests
  final client = Client();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      home: Scaffold(
        appBar: AppBar(title: Text("Pokédex")),
        body: buildPokemonScreen(),
      ),
    );
  }

  Widget buildPokemonScreen() {
    // FutureBuilder is a Flutter widget used to build layouts with async data, like data fetched from an API.
    return FutureBuilder(
      future: fetchPokemonsFromAPI(),

      // The snapshot contains the list of Pokémons
      builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
        if (snapshot.hasData) {
          return HomeScreen(pokemons: snapshot.data);
        } else {
          // Show a loading spinner
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<List<Pokemon>> fetchPokemonsFromAPI() async {
    final response = await client.get('https://raw.githubusercontent.com/rsr-itminds/flutter-workshop/master/data/pokedex.json');

    // Get the JSON data from the response
    final List<dynamic> data = json.decode(response.body);

    // Convert JSON to Pokemons by using the named constructor fromJson
    return data.map((json) => Pokemon.fromJson(json)).toList();
  }
}
