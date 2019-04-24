class Pokemon {
  String number;
  String name;
  String image;
  String height;
  String weight;
  List<String> type;
  List<String> weaknesses;

  Pokemon(this.name, this.image, this.number, this.type, this.height, this.weight, this.weaknesses);

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
    );
  }
}
