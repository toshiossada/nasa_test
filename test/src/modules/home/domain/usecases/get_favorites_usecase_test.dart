import 'package:eclipse/src/modules/home/domain/entities/apod_entity.dart';
import 'package:eclipse/src/modules/home/domain/enums/media_type_enum.dart';
import 'package:eclipse/src/modules/home/domain/repositories/nasa_repository.dart';
import 'package:eclipse/src/modules/home/domain/usecases/get_favorites_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_favorites_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NasaRepository>()])
void main() {
  final mockNasaRepository = MockNasaRepository();
  late final getFavoritesUsecase = GetFavoritesUsecase(
    repository: mockNasaRepository,
  );

  test('Given a GetFavoritesUsecase, '
      'When call is invoked, '
      'Then it should return a list of ApodEntity', () async {
    // Given
    final apodEntity = ApodEntity(
      title: 'Test Title',
      explanation: 'Test Explanation',
      hdUrl: 'https://example.com/hd.jpg',
      url: 'https://example.com/image.jpg',
      date: '2025-03-09',
      mediaType: 'image',
    );
    final favorites = {apodEntity};

    when(mockNasaRepository.getFatorites()).thenAnswer((_) async => favorites);

    // When
    final result = await getFavoritesUsecase.call();

    // Then
    expect(result, isA<List<ApodEntity>>());
    expect(result.length, 1);
    expect(result.first.title, 'Test Title');
    expect(result.first.explanation, 'Test Explanation');
    expect(result.first.hdUrl, 'https://example.com/hd.jpg');
    expect(result.first.url, 'https://example.com/image.jpg');
    expect(result.first.date, '2025-03-09');
    expect(result.first.mediaType, MediaTypeEnum.image);
  });
}
