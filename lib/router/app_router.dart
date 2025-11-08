import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sprout_test/presentation/detail_page/pokemon_detail_page.dart';
import 'package:sprout_test/presentation/home_page/home_page.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
    
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomePage(),
      ),

   
      GoRoute(
        path: '/detail/:id',
        name: 'detail',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          final url =
              state.extra as String? ??
              '';
          return PokemonDetailPage(pokemonId: id, pokemonUrl: url);
        },
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
