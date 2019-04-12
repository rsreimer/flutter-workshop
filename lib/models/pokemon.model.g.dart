// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
      json['name'] as String,
      json['img'] as String,
      json['id'] as int,
      (json['types'] as List)?.map((e) => e as String)?.toList(),
      json['height'] as String,
      json['weight'] as String,
      (json['weaknesses'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img': instance.img,
      'height': instance.height,
      'weight': instance.weight,
      'types': instance.types,
      'weaknesses': instance.weaknesses
    };
