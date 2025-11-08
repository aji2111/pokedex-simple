import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprout_test/models/pokemon_detail.dart';
import 'package:sprout_test/service/pokemon_repository.dart';

final pokemonRepositoryProvider = Provider((ref) => PokemonRepository());

final pokemonDetailProvider =
    FutureProvider.family<PokemonDetail, String>((ref, url) async {
  final repo = ref.read(pokemonRepositoryProvider);
  final detail = await repo.fetchPokemonDetail(url: url);
  return detail;
});
