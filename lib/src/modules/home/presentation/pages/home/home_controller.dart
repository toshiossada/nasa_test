import '../../../../core/errors.dart';
import '../../../domain/entities/apod_entity.dart';
import '../../../domain/usecases/get_favorites_usecase.dart';
import '../../../domain/usecases/get_media_od_day_usecase.dart';
import '../../../domain/usecases/save_favorites_usecase.dart';
import 'home_store.dart';
import 'state/favorite_state.dart';
import 'state/home_state.dart';

class HomeController {
  const HomeController({
    required this.store,
    required this.getMediaOfDayUsecase,

    required this.getFavoritesUsecase,
    required this.saveFavoritesUsecase,
  });

  final HomeStore store;
  final GetMediaOfDayUsecase getMediaOfDayUsecase;
  final GetFavoritesUsecase getFavoritesUsecase;
  final SaveFavoritesUsecase saveFavoritesUsecase;
  void init() {
    store.homeStream.addListener(() {
      final _ = switch (store.homeState) {
        HomeStateLoading() => _loadFavorites(),
        _ => null,
      };
    });
    store.favoriteStream.addListener(() {
      final _ = switch (store.favoriteState) {
        FavoriteStateLoading(date: final date) => _loadMedia(date),
        FavoriteStateSave(
          apod: final apod,
          favorites: final favorites,
          delete: final delete,
        ) =>
          _saveFavorites(apod: apod, favorites: favorites, delete: delete),
        _ => null,
      };
    });
  }

  void load(DateTime date) {
    store.homeState = HomeStateLoading();
    store.favoriteState = FavoriteStateLoading(date: date);
  }

  void saveFavorites({
    required ApodEntity apod,
    required List<ApodEntity> favorites,
    required bool isFavorite,
  }) {
    store.favoriteState = FavoriteStateSave(
      apod: apod,
      favorites: favorites,
      delete: isFavorite,
    );
  }

  Future<void> _loadMedia(DateTime date) async {
    try {
      final apod = await getMediaOfDayUsecase(date);

      store.homeState = HomeStateSuccess(apod: apod);
    } on Failure catch (e) {
      store.homeState = HomeStateFailure(failure: e);
    } catch (e) {
      store.homeState = HomeStateFailure(
        failure: Failure(message: e.toString()),
      );
    }
  }

  Future<void> _loadFavorites() async {
    final favorites = await getFavoritesUsecase();

    store.favoriteState = FavoriteStateSuccess(favorites: favorites);
  }

  Future<void> _saveFavorites({
    required ApodEntity apod,
    required List<ApodEntity> favorites,
    required bool delete,
  }) async {
    await saveFavoritesUsecase(apod: apod, delete: delete);
    final newFavorites = List<ApodEntity>.from(favorites);
    if (delete) {
      newFavorites.removeWhere((e) => e.date == apod.date);
    } else {
      newFavorites.add(apod);
    }

    store.favoriteState = FavoriteStateSuccess(favorites: newFavorites);
  }

  void dispose() {
    store.homeStream.dispose();
    store.favoriteStream.dispose();
  }
}
