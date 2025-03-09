import 'package:eclipse/src/modules/home/domain/entities/apod_entity.dart';
import 'package:eclipse/src/modules/home/domain/enums/media_type_enum.dart';
import 'package:eclipse/src/modules/home/infra/repositories/datasource/favorites_datasource.dart';
import 'package:eclipse/src/modules/home/infra/repositories/datasource/nasa_datasource.dart';
import 'package:eclipse/src/modules/home/infra/repositories/mappers/apod_mapper.dart';
import 'package:eclipse/src/modules/home/infra/repositories/models/apod_model.dart';
import 'package:eclipse/src/modules/home/infra/repositories/nasa_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nasa_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<NasaDatasource>(),
  MockSpec<FavoritesDatasource>(),
])
void main() {
  final mockNasaDatasource = MockNasaDatasource();
  final mockFavoritesDatasource = MockFavoritesDatasource();
  final mockMapper = ApodMapper();
  late final nasaRepository = NasaRepositoryImpl(
    nasaDatasoure: mockNasaDatasource,
    favoritesDatasource: mockFavoritesDatasource,
    mapper: mockMapper,
  );

  testWidgets('Given a NasaRepositoryImpl, '
      'When getMediaOfDay is called with a valid date, '
      'Then it should return a valid ApodEntity', (WidgetTester tester) async {
    const date = '2025-03-09';
    final apodModel = ApodModel(
      title: 'Test Title',
      explanation: 'Test Explanation',
      hdUrl: 'https://example.com/hd.jpg',
      url: 'https://example.com/image.jpg',
      date: date,
      mediaType: 'image',
    );

    when(
      mockNasaDatasource.getMediaOfDay(date),
    ).thenAnswer((_) async => apodModel);

    final result = await nasaRepository.getMediaOfDay(date);

    expect(result, isA<ApodEntity>());
    expect(result.title, 'Test Title');
    expect(result.explanation, 'Test Explanation');
    expect(result.hdUrl, 'https://example.com/hd.jpg');
    expect(result.url, 'https://example.com/image.jpg');
    expect(result.date, date);
    expect(result.mediaType, MediaTypeEnum.image);
  });

  testWidgets('Given a NasaRepositoryImpl, '
      'When getFavorites is called, '
      'Then it should return a set of ApodEntity', (WidgetTester tester) async {
    final apodModel = ApodModel(
      title: 'Test Title',
      explanation: 'Test Explanation',
      hdUrl: 'https://example.com/hd.jpg',
      url: 'https://example.com/image.jpg',
      date: '2025-03-09',
      mediaType: 'image',
    );

    when(mockFavoritesDatasource.getAll()).thenAnswer((_) async => {apodModel});

    final result = await nasaRepository.getFatorites();

    expect(result, isA<Set<ApodEntity>>());
    expect(result.length, 1);
    final entity = result.first;
    expect(entity.title, 'Test Title');
    expect(entity.explanation, 'Test Explanation');
    expect(entity.hdUrl, 'https://example.com/hd.jpg');
    expect(entity.url, 'https://example.com/image.jpg');
    expect(entity.date, '2025-03-09');
    expect(entity.mediaType, MediaTypeEnum.image);
  });

  testWidgets('Given a NasaRepositoryImpl, '
      'When addFavorites is called with a valid ApodEntity, '
      'Then it should store the ApodEntity in the favorites datasource', (
    WidgetTester tester,
  ) async {
    final apodEntity = ApodEntity(
      title: 'Test Title',
      explanation: 'Test Explanation',
      hdUrl: 'https://example.com/hd.jpg',
      url: 'https://example.com/image.jpg',
      date: '2025-03-09',
      mediaType: 'image',
    );

    await nasaRepository.addFavorites(apodEntity);

    verify(mockFavoritesDatasource.put(any)).called(1);
  });

  testWidgets('Given a NasaRepositoryImpl, '
      'When removeFavorite is called with a valid ApodEntity, '
      'Then it should remove the ApodEntity from the favorites datasource', (
    WidgetTester tester,
  ) async {
    final apodEntity = ApodEntity(
      title: 'Test Title',
      explanation: 'Test Explanation',
      hdUrl: 'https://example.com/hd.jpg',
      url: 'https://example.com/image.jpg',
      date: '2025-03-09',
      mediaType: 'image',
    );

    await nasaRepository.removeFavorite(apodEntity);

    verify(mockFavoritesDatasource.remove(any)).called(1);
  });
}
