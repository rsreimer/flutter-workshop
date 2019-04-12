import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/screens/home.screen.dart';
import 'package:http/http.dart';

void main() => runApp(Pokedex());

class Pokedex extends StatelessWidget {
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
    return FutureBuilder(
      future: fetchPokemons(),
      builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
        return snapshot.hasData
            ? HomeScreen(pokemons: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<List<Pokemon>> fetchPokemons() async {
    final response = await client.get('http://rsreimer.com/pokedex.json');
    final List<dynamic> data = json.decode(response.body);

    return data.map((json) => Pokemon.fromJson(json)).toList();
  }
}
