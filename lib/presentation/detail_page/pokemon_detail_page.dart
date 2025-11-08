// lib/presentation/detail_page/detail_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprout_test/models/pokemon_detail.dart';
import 'package:sprout_test/presentation/detail_page/component/about_tab.dart';
import 'package:sprout_test/presentation/detail_page/component/pokemon_base_stats.dart';
import 'package:sprout_test/presentation/detail_page/component/pokemon_header_tab.dart';
import 'package:sprout_test/presentation/detail_page/component/pokemon_moves_tab.dart';
import 'package:sprout_test/presentation/detail_page/component/pokemon_tab_evolution.dart';
import 'package:sprout_test/presentation/detail_page/providers/pokemon_detail_providers.dart';
import 'package:sprout_test/utils/animation_widgets.dart';
import 'package:sprout_test/utils/app_colors.dart';

class PokemonDetailPage extends ConsumerWidget {
  final int pokemonId;
  final String pokemonUrl;

  const PokemonDetailPage({
    super.key,
    required this.pokemonId,
    required this.pokemonUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDetail = ref.watch(pokemonDetailProvider(pokemonUrl));
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon Detail'),
        backgroundColor: asyncDetail.when(
          data: (pokemon) => getTypeColor(pokemon.types.first),
          loading: () => Colors.grey,
          error: (_, __) => Colors.grey,
        ),
      ),
      body: asyncDetail.when(
        data: (pokemon) => isLandscape
            ? _buildLandscapeLayout(context, pokemon)
            : _buildPortraitLayout(context, pokemon),
        loading: () => const Center(child: LoadingAnimationWidget()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context, PokemonDetail pokemon) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          // Gunakan widget baru
          PokemonHeader(pokemon: pokemon, pokemonId: pokemonId),
          const TabBar(
            labelColor: Colors.redAccent,
            indicatorColor: Colors.redAccent,
            tabs: [
              Tab(text: "About"),
              Tab(text: "Base Stats"),
              Tab(text: "Evolution"),
              Tab(text: "Moves"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Gunakan widget baru
                PokemonAboutTab(pokemon: pokemon),
                PokemonBaseStatsTab(pokemon: pokemon),
                PokemonEvolutionTab(pokemon: pokemon),
                PokemonMovesTab(pokemon: pokemon),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context, PokemonDetail pokemon) {
    return Row(
      children: [
        SizedBox(width: 250, child: PokemonCompactHeader(pokemon: pokemon)),
        Expanded(
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                const TabBar(
                  labelColor: Colors.redAccent,
                  indicatorColor: Colors.redAccent,
                  tabs: [
                    Tab(text: "About"),
                    Tab(text: "Base Stats"),
                    Tab(text: "Evolution"),
                    Tab(text: "Moves"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Gunakan widget baru dengan flag isLandscape
                      PokemonAboutTab(pokemon: pokemon, isLandscape: true),
                      PokemonBaseStatsTab(pokemon: pokemon),
                      PokemonEvolutionTab(pokemon: pokemon, isLandscape: true),
                      PokemonMovesTab(pokemon: pokemon, isLandscape: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
