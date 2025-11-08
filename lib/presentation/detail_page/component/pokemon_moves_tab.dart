import 'package:flutter/material.dart';
import 'package:sprout_test/models/pokemon_detail.dart';
import 'package:sprout_test/utils/app_colors.dart';
import 'package:sprout_test/utils/type_pokemon.dart';

class PokemonMovesTab extends StatelessWidget {
  final PokemonDetail pokemon;
  final bool isLandscape;

  const PokemonMovesTab({
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
      child: ListView.builder(
        itemCount: pokemon.moves.length,
        itemBuilder: (context, index) {
          final moveName = pokemon.moves[index];
          final String typeForMove =
              pokemon.types[index % pokemon.types.length];
          final iconData = getIconForType(typeForMove);
          final iconColor = getTypeColor(typeForMove);

          return ListTile(
            leading: Icon(iconData, color: iconColor),
            title: Text(moveName),
          );
        },
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 10,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: pokemon.moves.length,
      itemBuilder: (context, index) {
        final moveName = pokemon.moves[index];

       
        final String typeForMove = pokemon.types[index % pokemon.types.length];

       
        final iconData = getIconForType(typeForMove);
        final iconColor = getTypeColor(typeForMove);

      
        return ListTile(
          dense: true,
          leading: Icon(iconData, color: iconColor),
          title: Text(
            moveName,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        );
      },
    );
  }
}
