class PokemonDetail {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final Map<String, int> baseStats;
  final List<String> abilities;
  final List<String> moves;
  final List<Evolution> evolutions;
  final String speciesUrl;

  // Tambahan
  final String speciesName;
  final int height;
  final int weight;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.baseStats,
    required this.abilities,
    required this.moves,
    required this.evolutions,
    required this.speciesUrl,
    required this.speciesName,
    required this.height,
    required this.weight,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json, {String? speciesName}) {
    return PokemonDetail(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'] ??
          json['sprites']['front_default'] ??
          '',
      types: (json['types'] as List)
          .map((t) => t['type']['name'].toString())
          .toList(),
      baseStats: {
        for (var stat in json['stats'])
          stat['stat']['name']: stat['base_stat'],
      },
      abilities: (json['abilities'] as List)
          .map((a) => a['ability']['name'].toString())
          .toList(),
      moves: (json['moves'] as List)
          .take(10)
          .map((m) => m['move']['name'].toString())
          .toList(),
      evolutions: [], // akan diisi terpisah
      speciesUrl: json['species']['url'],
      speciesName: speciesName ?? '',
      height: json['height'],
      weight: json['weight'],
    );
  }
}


class Evolution {
  final String name;
  final String imageUrl;

  Evolution({
    required this.name,
    required this.imageUrl,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      name: json['name'],
      imageUrl: json['sprites']?['other']?['official-artwork']
              ?['front_default'] ??
          '',
    );
  }
}