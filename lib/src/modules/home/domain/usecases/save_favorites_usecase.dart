import '../entities/apod_entity.dart';
import '../repositories/nasa_repository.dart';

class SaveFavoritesUsecase {
  SaveFavoritesUsecase({required this.repository});

  final NasaRepository repository;

  Future<void> call({required ApodEntity apod, required bool delete}) {
    if (delete) {
      return repository.removeFavorite(apod);
    }

    return repository.addFavorites(apod);
  }
}
