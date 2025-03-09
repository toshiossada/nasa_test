import '../models/apod_model.dart';

abstract interface class FavoritesDatasource {
  Future<Set<ApodModel>> getAll();
  Future<void> put(ApodModel data);
  Future<void> remove(ApodModel data);
}
