import 'package:design_system/atoms.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/apod_entity.dart';
import 'home_controller.dart';
import 'state/favorite_state.dart';
import 'state/home_state.dart';
import 'widgets/date_widget.dart';
import 'widgets/fab_home_widget.dart';
import 'widgets/failure_state_widget.dart';
import 'widgets/loading_state_widget.dart';
import 'widgets/success_state_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.controller, this.selectedDate, super.key});
  final HomeController controller;
  final DateTime? selectedDate;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get controller => widget.controller;
  late DateTime selectedDate = widget.selectedDate ?? DateTime.now();

  @override
  void initState() {
    super.initState();
    controller
      ..init()
      ..load(selectedDate);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onFavoritePressed(FavoriteState favoriteState, HomeState homeState) {
    if (homeState is! HomeStateSuccess) return;

    final HomeStateSuccess(apod: apod) = homeState;

    final _ = switch (favoriteState) {
      FavoriteStateSave(favorites: final favorites) ||
      FavoriteStateSuccess(favorites: final favorites) => controller
          .saveFavorites(
            apod: apod,
            favorites: favorites,
            isFavorite: isFavorite(favoriteState, homeState),
          ),
      _ => null,
    };
  }

  Color _getIconFavoriteColor(
    FavoriteState favoriteState,
    HomeState homeState,
  ) {
    return isFavorite(favoriteState, homeState) ? Colors.red : Colors.black;
  }

  bool isFavorite(FavoriteState favoriteState, HomeState homeState) {
    if (homeState is! HomeStateSuccess) return false;
    if (favoriteState is! FavoriteStateSave &&
        favoriteState is! FavoriteStateSuccess) {
      return false;
    }

    final HomeStateSuccess(apod: apod) = homeState;

    return switch (favoriteState) {
      FavoriteStateSave(favorites: final favorites) ||
      FavoriteStateSuccess(
        favorites: final favorites,
      ) => favorites.any((e) => e == apod),
      _ => false,
    };
  }

  List<ApodEntity> getFavorites(FavoriteState favoriteState) {
    if (favoriteState is! FavoriteStateSave &&
        favoriteState is! FavoriteStateSuccess) {
      return [];
    }

    return switch (favoriteState) {
      FavoriteStateSave(favorites: final favorites) ||
      FavoriteStateSuccess(favorites: final favorites) => favorites,
      _ => [],
    };
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.store.favoriteStream,
      builder: (_, favorites, _) {
        return ValueListenableBuilder(
          valueListenable: controller.store.homeStream,
          builder: (_, homeState, _) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
                actions: [
                  FIconButton(
                    onPressed: () => _onFavoritePressed(favorites, homeState),
                    icon: FIcon(
                      tooltip:
                          isFavorite(favorites, homeState)
                              ? 'desfavoritar'
                              : 'favoritar',
                      key: const Key('btnLike'),
                      icon: Icons.favorite,
                      color: _getIconFavoriteColor(favorites, homeState),
                    ),
                  ),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateWidget(
                    initialDate: selectedDate,
                    onSelectDate: (DateTime selectedDate) {
                      controller.load(selectedDate);
                      this.selectedDate = selectedDate;
                    },
                  ),
                  switch (homeState) {
                    HomeStateInitial() => const FContainer(),
                    HomeStateLoading() => const LoadingStateWidget(),
                    HomeStateSuccess(apod: final apod) => SuccessStateWidget(
                      apod: apod,
                    ),
                    HomeStateFailure(failure: final failure) =>
                      FailureStateWidget(
                        failure: failure,
                        retry: () {
                          controller.load(selectedDate);
                        },
                      ),
                    // _ => const LoadingStateWidget(),
                  },
                ],
              ),

              floatingActionButton: FABHomeWiddget(
                state: favorites,
                onTap: ({
                  required ApodEntity apod,
                  required List<ApodEntity> favorites,
                  required bool isFavorite,
                }) {
                  controller.saveFavorites(
                    apod: apod,
                    favorites: favorites,
                    isFavorite: isFavorite,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
