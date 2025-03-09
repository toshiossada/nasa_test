import 'package:eclipse/src/modules/home/domain/entities/apod_entity.dart';
import 'package:eclipse/src/modules/home/domain/enums/media_type_enum.dart';
import 'package:eclipse/src/modules/home/domain/repositories/nasa_repository.dart';
import 'package:eclipse/src/modules/home/domain/usecases/get_media_od_day_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_media_od_day_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NasaRepository>()])
void main() {
  group('GetMediaOfDayUsecase', () {
    final mockNasaRepository = MockNasaRepository();
    late final getMediaOfDayUsecase = GetMediaOfDayUsecase(
      repository: mockNasaRepository,
    );

    test('Given a GetMediaOfDayUsecase, '
        'When call is invoked with a valid date, '
        'Then it should return a valid ApodEntity', () async {
      // Given
      final date = DateTime(2025, 3, 9);
      final dateString = DateFormat('yyyy-MM-dd').format(date);
      final apodEntity = ApodEntity(
        title: 'Test Title',
        explanation: 'Test Explanation',
        hdUrl: 'https://example.com/hd.jpg',
        url: 'https://example.com/image.jpg',
        date: dateString,
        mediaType: 'image',
      );

      when(
        mockNasaRepository.getMediaOfDay(dateString),
      ).thenAnswer((_) async => apodEntity);

      // When
      final result = await getMediaOfDayUsecase.call(date);

      // Then
      expect(result, isA<ApodEntity>());
      expect(result.title, 'Test Title');
      expect(result.explanation, 'Test Explanation');
      expect(result.hdUrl, 'https://example.com/hd.jpg');
      expect(result.url, 'https://example.com/image.jpg');
      expect(result.date, dateString);
      expect(result.mediaType, MediaTypeEnum.image);
    });

    test('Given a GetMediaOfDayUsecase, '
        'When call is invoked with a future date, '
        'Then it should throw an ArgumentError', () async {
      // Given
      final futureDate = DateTime.now().add(const Duration(days: 1));

      // When & Then
      expect(() => getMediaOfDayUsecase.call(futureDate), throwsArgumentError);
    });
  });
}
