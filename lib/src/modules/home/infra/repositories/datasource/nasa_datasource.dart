import '../models/apod_model.dart';

abstract interface class NasaDatasource {
  Future<ApodModel> getMediaOfDay(String date);
}
