import 'package:intl/intl.dart';

import '../entities/apod_entity.dart';
import '../repositories/nasa_repository.dart';

class GetMediaOfDayUsecase {
  GetMediaOfDayUsecase({required this.repository});

  final NasaRepository repository;

  Future<ApodEntity> call(DateTime date) {
    final now = DateTime.now();
    if (date.isAfter(now)) {
      throw ArgumentError('A data não pode ser futura.');
    }
    final dateString = DateFormat('yyyy-MM-dd').format(date);
    return repository.getMediaOfDay(dateString);
  }
}
