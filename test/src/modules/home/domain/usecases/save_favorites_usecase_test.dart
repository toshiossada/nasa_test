import 'package:eclipse/src/modules/home/domain/entities/apod_entity.dart';
import 'package:eclipse/src/modules/home/domain/repositories/nasa_repository.dart';
import 'package:eclipse/src/modules/home/domain/usecases/save_favorites_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_favorites_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NasaRepository>()])
void main() {
  group('SaveFavoritesUsecase', () {
    late final mockNasaRepository = MockNasaRepository();
    late final saveFavoritesUsecase = SaveFavoritesUsecase(
      repository: mockNasaRepository,
    );

    test('Given a SaveFavoritesUsecase, '
        'When call is invoked with delete = true, '
        'Then it should call removeFavorite on the repository', () async {
      // Given
      final apodEntity = ApodEntity(
        title: 'Test Title',
        explanation: 'Test Explanation',
        hdUrl: 'https://example.com/hd.jpg',
        url: 'https://example.com/image.jpg',
        date: '2025-03-09',
        mediaType: 'image',
      );

      // When
      await saveFavoritesUsecase.call(apod: apodEntity, delete: true);

      // Then
      verify(mockNasaRepository.removeFavorite(apodEntity)).called(1);
    });

    test('Given a SaveFavoritesUsecase, '
        'When call is invoked with delete = false, '
        'Then it should call addFavorites on the repository', () async {
      // Given
      final apodEntity = ApodEntity(
        title: 'Test Title',
        explanation: 'Test Explanation',
        hdUrl: 'https://example.com/hd.jpg',
        url: 'https://example.com/image.jpg',
        date: '2025-03-09',
        mediaType: 'image',
      );

      // When
      await saveFavoritesUsecase.call(apod: apodEntity, delete: false);

      // Then
      verify(mockNasaRepository.addFavorites(apodEntity)).called(1);
    });

    test('Given a SaveFavoritesUsecase, '
        'When call is invoked and the repository throws an exception, '
        'Then it should propagate the exception', () async {
      // Given
      final apodEntity = ApodEntity(
        title: 'Test Title',
        explanation: 'Test Explanation',
        hdUrl: 'https://example.com/hd.jpg',
        url: 'https://example.com/image.jpg',
        date: '2025-03-09',
        mediaType: 'image',
      );
      final exception = Exception('Test Exception');

      when(mockNasaRepository.addFavorites(apodEntity)).thenThrow(exception);

      // When & Then
      expect(
        () => saveFavoritesUsecase.call(apod: apodEntity, delete: false),
        throwsException,
      );
    });
  });
}
