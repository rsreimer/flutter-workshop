import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/screens/home.screen.dart';
import 'package:http/http.dart';

void main() => runApp(Pokedex());

class Pokedex extends StatelessWidget {
  // Client is used for HTTP-requests.
  final client = Client();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Pokédex"),
          backgroundColor: Colors.blueGrey[500],
        ),
        body: buildPokemonScreen(),
      ),
    );
  }

  Widget buildPokemonScreen() {
    // FutureBuilder is a Flutter widget used to build layouts with futures.
    // The builder-method will be called, when a future resolves.
    return FutureBuilder(
      future: fetchPokemons(),
      // The snapshot contains the pokemon data.
      builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
        // If there is some data in the snapshot/future, return the HomeScreen
        // Else return a loading indicator.
        return snapshot.hasData
            // Pass the list of pokemons to the HomeScreen
            ? HomeScreen(pokemons: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  // Returns a Future with the fetched pokemons
  Future<List<Pokemon>> fetchPokemons() async {
    // HTTP Get request
    final response = await client.get('https://raw.githubusercontent.com/rsritminds/flutter-workshop/master/data/pokedex.json');

    // Get the JSON-object from the response 
    final List<dynamic> data = json.decode(response.body);

    // Convert JSON to Pokemons by using the named constructor fromJson.
    return data.map((json) => Pokemon.fromJson(json)).toList();
  }
}
