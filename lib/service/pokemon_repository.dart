import 'package:sprout_test/models/pokemon.dart';
import 'package:sprout_test/models/pokemon_detail.dart';
import 'package:sprout_test/service/net_utils.dart';

class PokemonRepository {
  static const String _baseUrl = 'https://pokeapi.co/api/v2/pokemon';
 
  final NetworkUtil _util = NetworkUtil();

 
  Future<List<Pokemon>> fetchPokemonList({
    required int offset,
    required int limit,
  }) async {
    final listData = await _util.get("$_baseUrl?offset=$offset&limit=$limit");
    final results = listData['results'] as List;

    final allDetailData = await Future.wait(
      results.map((summary) async {
        final detailData = await _util.get(summary['url']);

       
        final combinedData = Map<String, dynamic>.from(detailData);
        combinedData['url'] = summary['url'];

        return combinedData;
      }),
    );

    return allDetailData.map((data) => Pokemon.fromJson(data)).toList();
  }

 
  Future<PokemonDetail> fetchPokemonDetail({required String url}) async {
  final data = await _util.get(url);

 
  final speciesData = await _util.get(data['species']['url']);
  final speciesName = speciesData['name'];

 
  final evolutionChainUrl = speciesData['evolution_chain']['url'];
  final evolutionData = await _util.get(evolutionChainUrl);
  final evolutions = _parseEvolutionChain(evolutionData['chain']);

 
  final pokemonDetail = PokemonDetail.fromJson(data, speciesName: speciesName);
  return PokemonDetail(
    id: pokemonDetail.id,
    name: pokemonDetail.name,
    imageUrl: pokemonDetail.imageUrl,
    types: pokemonDetail.types,
    baseStats: pokemonDetail.baseStats,
    abilities: pokemonDetail.abilities,
    moves: pokemonDetail.moves,
    evolutions: evolutions,
    speciesUrl: pokemonDetail.speciesUrl,
    speciesName: speciesName,
    height: pokemonDetail.height,
    weight: pokemonDetail.weight,
  );
}

  
  List<Evolution> _parseEvolutionChain(Map<String, dynamic> chain) {
    final List<Evolution> evolutions = [];

    void traverse(Map<String, dynamic> node) {
      evolutions.add(
        Evolution(
          name: node['species']['name'],
          imageUrl:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${_extractIdFromUrl(node['species']['url'])}.png',
        ),
      );

      final evolvesTo = node['evolves_to'] as List<dynamic>;
      for (var e in evolvesTo) {
        traverse(e);
      }
    }

    traverse(chain);
    return evolutions;
  }

  
  int _extractIdFromUrl(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return int.parse(segments[segments.length - 2]);
  }
}
