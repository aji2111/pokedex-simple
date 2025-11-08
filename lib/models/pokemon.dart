import 'package:json_annotation/json_annotation.dart';


part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final int id;
  final String name;
  final List<PokemonType> types;
  final PokemonSprites sprites;
  final String? url;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.sprites,
    this.url,
  });

  /// Metode factory untuk membuat instance Pokemon dari JSON.
  /// Generator kode akan membuat implementasinya.
  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  /// Metode untuk mengubah instance Pokemon kembali ke JSON.
  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  // --- HELPER METHODS (untuk kemudahan) ---

  /// Mengembalikan URL gambar artwork resmi.
  /// Ini jauh lebih mudah daripada mengakses sprites.other.officialArtwork.frontDefault
  String get imageUrl => sprites.other.officialArtwork.frontDefault;

  /// Mengembalikan ID yang diformat dengan nol di depan (misal: #001, #025).
  String get formattedId {
    return '#${id.toString().padLeft(3, '0')}';
  }

  /// Mengembalikan daftar nama tipe sebagai string (misal: ['grass', 'poison']).
  List<String> get typeNames {
    return types.map((type) => type.type.name).toList();
  }
}

/// Model untuk setiap tipe yang dimiliki Pokémon.
@JsonSerializable()
class PokemonType {
  final int slot;
  final TypeInfo type;

  PokemonType({required this.slot, required this.type});

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

/// Model untuk informasi detail tipe (nama dan URL).
@JsonSerializable()
class TypeInfo {
  final String name;
  final String url;

  TypeInfo({required this.name, required this.url});

  factory TypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TypeInfoToJson(this);
}

/// Model untuk objek 'sprites' dari respons API.
@JsonSerializable()
class PokemonSprites {
  final OtherSprites other;

  PokemonSprites({required this.other});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);
}

/// Model untuk objek 'other' di dalam sprites.
@JsonSerializable()
class OtherSprites {
  /// Kita menggunakan @JsonKey karena 'official-artwork' bukan nama variabel yang valid di Dart.
  @JsonKey(name: 'official-artwork')
  final OfficialArtwork officialArtwork;

  OtherSprites({required this.officialArtwork});

  factory OtherSprites.fromJson(Map<String, dynamic> json) =>
      _$OtherSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$OtherSpritesToJson(this);
}

/// Model untuk menyimpan URL artwork resmi.
@JsonSerializable()
class OfficialArtwork {
  /// Kita menggunakan @JsonKey karena 'front_default' bukan nama variabel yang valid.
  @JsonKey(name: 'front_default')
  final String frontDefault;

  OfficialArtwork({required this.frontDefault});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);
}