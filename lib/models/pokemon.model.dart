
class Evolution {
  String number;
  String name;

  Evolution(this.number, this.name);

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      json['number'] as String,
      json['name'] as String,
    );
  }
}

class Pokemon {
  String number;
  String name;
  String image;
  String height;
  String weight;
  List<String> type;
  List<String> weaknesses;

  // Used to saved the evolutions from API
  List<Evolution> prevEvolution;
  List<Evolution> nextEvolution;

  Pokemon(this.name, this.image, this.number, this.type, this.height, this.weight, this.weaknesses, this.prevEvolution, this.nextEvolution);

  // Constructor used for conversion from JSON to Pokémons.
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      json['name'] as String,
      json['image'] as String,
      json['number'] as String,
      (json['type'] as List)?.map((e) => e as String)?.toList(),
      json['height'] as String,
      json['weight'] as String,
      (json['weaknesses'] as List)?.map((e) => e as String)?.toList(),
      (json['prev_evolution'] as List)?.map((e) => Evolution.fromJson(e))?.toList(),
      (json['next_evolution'] as List)?.map((e) => Evolution.fromJson(e))?.toList(),
    );
  }
}
