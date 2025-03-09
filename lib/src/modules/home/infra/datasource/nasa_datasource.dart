import '../../../core/adapters/http_adapter/http_client_adapter.dart';
import '../repositories/datasource/nasa_datasource.dart';
import '../repositories/models/apod_model.dart';

class NasaDatasourceImpl implements NasaDatasource {
  const NasaDatasourceImpl({required this.client});

  final IHttpClientAdapter client;

  @override
  Future<ApodModel> getMediaOfDay(String date) async {
    final request = await client.get('/planetary/apod', queryParameters: {'date': date});
    
    final response = ApodModel.fromMap(request.data);

    return response;
  }
}


