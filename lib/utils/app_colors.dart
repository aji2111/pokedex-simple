

import 'package:flutter/material.dart';

Color getTypeColor(String? type) {
  switch (type) {
    case 'normal':
      return Colors.brown[400]!;
    case 'fire':
      return Colors.red[400]!;
    case 'water':
      return Colors.blue[400]!;
    case 'electric':
      return Colors.yellow[400]!;
    case 'grass':
      return Colors.green[400]!;
    case 'ice':
      return Colors.cyan[400]!;
    case 'fighting':
      return Colors.orange[400]!;
    case 'poison':
      return Colors.purple[400]!;
    case 'ground':
      return Colors.brown[300]!;
    case 'flying':
      return Colors.indigo[300]!;
    case 'psychic':
      return Colors.pink[400]!;
    case 'bug':
      return Colors.lightGreen[400]!;
    case 'rock':
      return Colors.grey[500]!;
    case 'ghost':
      return Colors.grey[600]!;
    case 'dragon':
      return Colors.indigo[600]!;
    case 'dark':
      return Colors.grey[800]!;
    case 'steel':
      return Colors.blueGrey[400]!;
    case 'fairy':
      return Colors.pink[200]!;
    default:
      return Colors.grey[400]!; // Warna default
  }
}