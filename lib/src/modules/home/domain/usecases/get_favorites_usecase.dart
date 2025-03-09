import '../entities/apod_entity.dart';
import '../repositories/nasa_repository.dart';

class GetFavoritesUsecase {
  GetFavoritesUsecase({required this.repository});

  final NasaRepository repository;

  Future<List<ApodEntity>> call() async {
    final result = await repository.getFatorites();
    return result.toList();
  }
}
