import 'package:flutter/material.dart';
import 'package:sprout_test/models/pokemon_detail.dart';
import 'package:sprout_test/utils/row_text.dart';

class PokemonAboutTab extends StatelessWidget {
  final PokemonDetail pokemon;
  final bool isLandscape;

  const PokemonAboutTab({
    super.key,
    required this.pokemon,
    this.isLandscape = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLandscape) {
      return _buildLandscapeLayout();
    }
    return _buildPortraitLayout();
  }

  Widget _buildPortraitLayout() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoSection(),
          const SizedBox(height: 16),
          _buildAbilitiesSection(),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(child: _buildAbilitiesSection()),
          const SizedBox(width: 20),
          Expanded(child: _buildInfoSection()),
        ],
      ),
    );
  }

  Widget _buildAbilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Abilities:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: pokemon.abilities
              .map(
                (a) => Chip(
                  label: Text(a),
                  backgroundColor: Colors.redAccent.withOpacity(0.2),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoRow(label: "Species", value: pokemon.speciesName),
        const SizedBox(height: 8),
        InfoRow(label: "Height", value: "${pokemon.height / 10} m"),
        const SizedBox(height: 8),
        InfoRow(label: "Weight", value: "${pokemon.weight / 10} kg"),
      ],
    );
  }
}
