import 'package:json_annotation/json_annotation.dart';

part 'pokemon.model.g.dart';

@JsonSerializable()
class Pokemon {
  int id;
  String name;
  String img;
  String height;
  String weight;
  List<String> types;
  List<String> weaknesses;

  Pokemon(this.name, this.img, this.id, this.types, this.height, this.weight,
      this.weaknesses);

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
