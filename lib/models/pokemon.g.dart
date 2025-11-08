// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  types: (json['types'] as List<dynamic>)
      .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
      .toList(),
  sprites: PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
  url: json['url'] as String?,
);

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'types': instance.types,
  'sprites': instance.sprites,
  'url': instance.url,
};

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
  slot: (json['slot'] as num).toInt(),
  type: TypeInfo.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{'slot': instance.slot, 'type': instance.type};

TypeInfo _$TypeInfoFromJson(Map<String, dynamic> json) =>
    TypeInfo(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$TypeInfoToJson(TypeInfo instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};

PokemonSprites _$PokemonSpritesFromJson(Map<String, dynamic> json) =>
    PokemonSprites(
      other: OtherSprites.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpritesToJson(PokemonSprites instance) =>
    <String, dynamic>{'other': instance.other};

OtherSprites _$OtherSpritesFromJson(Map<String, dynamic> json) => OtherSprites(
  officialArtwork: OfficialArtwork.fromJson(
    json['official-artwork'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$OtherSpritesToJson(OtherSprites instance) =>
    <String, dynamic>{'official-artwork': instance.officialArtwork};

OfficialArtwork _$OfficialArtworkFromJson(Map<String, dynamic> json) =>
    OfficialArtwork(frontDefault: json['front_default'] as String);

Map<String, dynamic> _$OfficialArtworkToJson(OfficialArtwork instance) =>
    <String, dynamic>{'front_default': instance.frontDefault};
