// lib/presentation/detail_page/widgets/pokemon_evolution_tab.dart

import 'package:flutter/material.dart';
import 'package:sprout_test/models/pokemon_detail.dart';

class PokemonEvolutionTab extends StatelessWidget {
  final PokemonDetail pokemon;
  final bool isLandscape;

  const PokemonEvolutionTab({
    super.key,
    required this.pokemon,
    this.isLandscape = false,
  });

  @override
  Widget build(BuildContext context) {
    if (pokemon.evolutions.isEmpty) {
      return const Center(child: Text("No evolution data"));
    }

    if (isLandscape) {
      return _buildLandscapeLayout();
    }
    return _buildPortraitLayout();
  }

  Widget _buildPortraitLayout() {
    return ListView.builder(
      itemCount: pokemon.evolutions.length,
      itemBuilder: (context, index) {
        final evo = pokemon.evolutions[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: Image.network(evo.imageUrl, height: 50, width: 50),
            title: Text(evo.name.toUpperCase()),
          ),
        );
      },
    );
  }

  Widget _buildLandscapeLayout() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: pokemon.evolutions.length,
      itemBuilder: (context, index) {
        final evo = pokemon.evolutions[index];
        return Card(
          child: ListTile(
            leading: Image.network(evo.imageUrl, height: 50, width: 50),
            title: Text(evo.name.toUpperCase()),
          ),
        );
      },
    );
  }
}