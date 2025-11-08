import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprout_test/presentation/home_page/providers/pokemon_list_providers.dart';
import 'package:sprout_test/presentation/home_page/component/pokemon_card.dart';
import 'package:sprout_test/utils/animation_widgets.dart'; // Import widget animasi
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(pokemonListProvider.notifier).fetchNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncPokemons = ref.watch(pokemonListProvider);
    final pokemons = asyncPokemons.value ?? [];
    final isInitialLoading = asyncPokemons.isLoading && pokemons.isEmpty;
    final isFetchingNextPage = ref
        .read(pokemonListProvider.notifier)
        .isFetchingNextPage;

    return Scaffold(
      appBar: AppBar(title: const Text('Pokedex')),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(pokemonListProvider.notifier).refresh();
        },
        child: isInitialLoading
            ? const Center(child: LoadingAnimationWidget())
            : GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: pokemons.length + (isFetchingNextPage ? 1 : 0),
                itemBuilder: (context, index) {
                  final pokemon = pokemons[index];

                  return InkWell(
                    onTap: () {
                      context.push('/detail/${pokemon.id}', extra: pokemon.url);
                    },
                    child: PokemonCard(pokemon: pokemon),
                  );
                },
              ),
      ),
    );
  }
}
