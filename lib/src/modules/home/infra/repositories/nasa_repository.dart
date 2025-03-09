import '../../../core/base_mapper.dart';
import '../../domain/entities/apod_entity.dart';
import '../../domain/repositories/nasa_repository.dart';
import 'datasource/favorites_datasource.dart';
import 'datasource/nasa_datasource.dart';
import 'models/apod_model.dart';

class NasaRepositoryImpl implements NasaRepository {
  const NasaRepositoryImpl({
    required this.mapper,
    required this.nasaDatasoure,
    required this.favoritesDatasource,
  });

  final NasaDatasource nasaDatasoure;
  final FavoritesDatasource favoritesDatasource;
  final BaseMapper<ApodEntity, ApodModel> mapper;

  @override
  Future<ApodEntity> getMediaOfDay(String date) async {
    final result = await nasaDatasoure.getMediaOfDay(date);

    return mapper.toEntity(result);
  }

  @override
  Future<Set<ApodEntity>> getFatorites() async {
    final result = await favoritesDatasource.getAll();

    return result.map(mapper.toEntity).toSet();
  }

  @override
  Future<void> addFavorites(ApodEntity data) {
    final model = mapper.toModel(data);
    return favoritesDatasource.put(model);
  }

  @override
  Future<void> removeFavorite(ApodEntity data) {
    final model = mapper.toModel(data);
    return favoritesDatasource.remove(model);
  }
}
