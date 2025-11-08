
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sprout_test/models/pokemon_detail.dart';
import 'package:sprout_test/utils/app_colors.dart';

class PokemonHeader extends StatelessWidget {
  final PokemonDetail pokemon;
  final int pokemonId;

  const PokemonHeader({
    super.key,
    required this.pokemon,
    required this.pokemonId,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        _buildBackgroundContainer(context),
        _buildBottomNotchCard(),
        _buildPokemonImage(),
      ],
    );
  }

  Widget _buildBackgroundContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: getTypeColor(pokemon.types.first),
        image: DecorationImage(
          image: AssetImage('assets/images/pokeball1.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name.toUpperCase(),
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: pokemon.types.map((t) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                t.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 1,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "#${pokemon.id.toString().padLeft(3, '0')}",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNotchCard() {
    return Positioned(
      bottom: -18.0,
      left: 0.0,
      right: 0.0,
      child: Card(
        margin: EdgeInsets.zero,
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 40,
          color: Colors.transparent,
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    return Positioned(
      top: 15,
      child: Hero(
        tag: 'pokemon-image-$pokemonId',
        child: CachedNetworkImage(
          imageUrl: pokemon.imageUrl,
          height: 200,

          fit: BoxFit.contain,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          errorWidget: (context, url, error) =>
              const Icon(Icons.error_outline, color: Colors.white, size: 40),
        ),
      ),
    );
  }
}

class PokemonCompactHeader extends StatelessWidget {
  final PokemonDetail pokemon;

  const PokemonCompactHeader({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.redAccent.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(pokemon.imageUrl, height: 120),
          const SizedBox(height: 8),
          Text(
            pokemon.name.toUpperCase(),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            alignment: WrapAlignment.center,
            children: pokemon.types
                .map(
                  (type) => Chip(
                    label: Text(
                      type.toUpperCase(),
                      style: const TextStyle(fontSize: 10),
                    ),
                    backgroundColor: Colors.redAccent.withOpacity(0.2),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
