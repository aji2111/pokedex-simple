// lib/presentation/detail_page/widgets/pokemon_base_stats_tab.dart

import 'package:flutter/material.dart';
import 'package:sprout_test/models/pokemon_detail.dart';

class PokemonBaseStatsTab extends StatelessWidget {
  final PokemonDetail pokemon;

  const PokemonBaseStatsTab({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: pokemon.baseStats.entries
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120, 
                      child: Text(
                        e.key.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(width: 16),

                    SizedBox(
                      width: 30,
                      child: Text(
                        e.value.toString(),
                        textAlign: TextAlign.right,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: e.value / 200,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
