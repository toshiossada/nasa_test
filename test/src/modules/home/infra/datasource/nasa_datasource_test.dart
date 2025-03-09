import 'package:eclipse/src/modules/core/adapters/http_adapter/http_client_adapter.dart';
import 'package:eclipse/src/modules/core/adapters/http_adapter/http_response.dart';
import 'package:eclipse/src/modules/home/infra/datasource/nasa_datasource.dart';
import 'package:eclipse/src/modules/home/infra/repositories/models/apod_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nasa_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IHttpClientAdapter>()])
void main() {
  late final mockHttpClientAdapter = MockIHttpClientAdapter();

  late final nasaDatasource = NasaDatasourceImpl(client: mockHttpClientAdapter);

  testWidgets('Given a NasaDatasourceImpl with a valid date, '
      'When getMediaOfDay is called, '
      'Then it should return a valid ApodModel', (WidgetTester tester) async {
    const date = '2025-03-09';
    final responseData = {
      'title': 'Test Title',
      'explanation': 'Test Explanation',
      'hdurl': 'https://example.com/hd.jpg',
      'url': 'https://example.com/image.jpg',
      'date': date,
      'media_type': 'image',
    };

    when(
      mockHttpClientAdapter.get(
        '/planetary/apod',
        queryParameters: {'date': date},
      ),
    ).thenAnswer(
      (_) async => HttpResponse(data: responseData, statusCode: 200),
    );

    final result = await nasaDatasource.getMediaOfDay(date);

    expect(result, isA<ApodModel>());
    expect(result.title, 'Test Title');
    expect(result.explanation, 'Test Explanation');
    expect(result.hdUrl, 'https://example.com/hd.jpg');
    expect(result.url, 'https://example.com/image.jpg');
    expect(result.date, date);
    expect(result.mediaType, 'image');
  });
}
