  import 'package:flutter/material.dart';

IconData getIconForType(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return Icons.local_fire_department;
      case 'water':
        return Icons.water_drop;
      case 'electric':
        return Icons.flash_on;
      case 'grass':
        return Icons.eco;
      case 'normal':
        return Icons.circle_outlined;
      case 'fighting':
        return Icons.sports_martial_arts;
      case 'psychic':
        return Icons.psychology;
      case 'poison':
        return Icons.science;
      case 'ground':
        return Icons.landscape;
      case 'flying':
        return Icons.air;
      case 'dragon':
        return Icons.auto_awesome;
      case 'ice':
        return Icons.ac_unit;
      case 'bug':
        return Icons.bug_report;
      case 'rock':
        return Icons.terrain;
      case 'ghost':
        return Icons.nights_stay;
      case 'dark':
        return Icons.dark_mode;
      case 'steel':
        return Icons.settings;
      case 'fairy':
        return Icons.auto_fix_high;
      default:
        return Icons.help_outline;
    }
  }