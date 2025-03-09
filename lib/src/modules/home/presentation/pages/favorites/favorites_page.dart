import 'package:design_system/atoms.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/apod_entity.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    required this.favorites,
    required this.onFavoritePressed,
    super.key,
  });
  final Set<ApodEntity> favorites;
  final Function({
    required List<ApodEntity> favorites,
    required ApodEntity apod,
    required bool isFavorite,
  })
  onFavoritePressed;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<ApodEntity> favorites = List.from(widget.favorites);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const FText('Favorites')),
      body: FColumn(
        children: [
          FExpanded(
            child: FListView.builder(
              itemCount: widget.favorites.length,
              itemBuilder: (_, index) {
                final apod = widget.favorites.toList()[index];
                return FListTile(
                  title: FText(apod.brlDate),
                  subtitle: FText(apod.title),
                  trailing: FIconButton(
                    onPressed: () {
                      final isFavorite = favorites.any((e) => e == apod);
                      if (isFavorite) {
                        favorites.remove(apod);
                      } else {
                        favorites.add(apod);
                      }
                      setState(() {});
                      widget.onFavoritePressed(
                        favorites: favorites,
                        apod: apod,
                        isFavorite: isFavorite,
                      );
                    },
                    icon: FIcon(
                      icon: Icons.favorite,
                      color:
                          favorites.any((e) => e == apod)
                              ? Colors.red
                              : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
