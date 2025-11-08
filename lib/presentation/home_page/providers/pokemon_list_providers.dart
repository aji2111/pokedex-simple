import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprout_test/models/pokemon.dart';
import 'package:sprout_test/service/pokemon_repository.dart';

final pokemonRepoProvider = Provider((ref) => PokemonRepository());

class PokemonListNotifier extends AsyncNotifier<List<Pokemon>> {
  int _offset = 0;
  final int _limit = 20;
  bool _isFetching = false;

  @override
  Future<List<Pokemon>> build() async {
    await refresh();
    return state.value ?? [];
  }

  Future<void> refresh() async {
    _offset = 0;
    _isFetching = false;
    state = const AsyncValue.loading();
    await _fetchPage(isRefresh: true);
  }

  Future<void> fetchNextPage() async {
    if (_isFetching) return;

    await _fetchPage();
  }

  Future<void> _fetchPage({bool isRefresh = false}) async {
    if (_isFetching) return;
    _isFetching = true;
    final repo = ref.read(pokemonRepoProvider);

    try {
      final newPokemons = await repo.fetchPokemonList(
        offset: _offset,
        limit: _limit,
      );

      if (newPokemons.isEmpty) return;

      final currentList = isRefresh ? [] : (state.value ?? []);
      state = AsyncValue.data([...currentList, ...newPokemons]);

      _offset += _limit;

      if (newPokemons.length < _limit) {
        return;
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    } finally {
      _isFetching = false;
    }
  }

  bool get isFetchingNextPage => _isFetching;
}

final pokemonListProvider =
    AsyncNotifierProvider<PokemonListNotifier, List<Pokemon>>(
      PokemonListNotifier.new,
    );
