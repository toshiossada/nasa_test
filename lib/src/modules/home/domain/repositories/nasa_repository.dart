import '../entities/apod_entity.dart';

abstract interface class NasaRepository {
  Future<ApodEntity> getMediaOfDay(String date);
  Future<Set<ApodEntity>> getFatorites();
  Future<void> addFavorites(ApodEntity data);
  Future<void> removeFavorite(ApodEntity data);
}
