import 'package:design_system/atoms.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/apod_entity.dart';
import '../state/favorite_state.dart';

class FABHomeWiddget extends StatelessWidget {
  const FABHomeWiddget({required this.state, required this.onTap, super.key});

  final FavoriteState state;
  final Function({
    required List<ApodEntity> favorites,
    required ApodEntity apod,
    required bool isFavorite,
  })
  onTap;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      FavoriteStateSave(favorites: final favorites) ||
      FavoriteStateSuccess(favorites: final favorites) => FBadge.count(
        backgroundColor: Colors.blueAccent,
        key: const Key('btnFavorites'),
        tooltip: '${favorites.toSet().length} favoritos',
        count: favorites.toSet().length,
        child: Semantics(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/favorite',
                arguments: {
                  'favorites': favorites.toSet(),
                  'onFavoritePressed': onTap,
                },
              );
            },
            child: const FIcon(icon: Icons.star, color: Colors.yellow),
          ),
        ),
      ),
      _ => Container(),
    };
  }
}
