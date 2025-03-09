import 'package:eclipse/src/modules/home/domain/entities/apod_entity.dart';
import 'package:eclipse/src/modules/home/domain/enums/media_type_enum.dart';
import 'package:eclipse/src/modules/home/infra/repositories/mappers/apod_mapper.dart';
import 'package:eclipse/src/modules/home/infra/repositories/models/apod_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final mapper = ApodMapper();

  test('Given an ApodModel, '
      'When mapped to ApodEntity, '
      'Then it should return a valid ApodEntity', () {
    // Given
    final apodModel = ApodModel(
      title: 'Test Title',
      explanation: 'Test Explanation',
      hdUrl: 'https://example.com/hd.jpg',
      url: 'https://example.com/image.jpg',
      date: '2025-03-09',
      mediaType: 'image',
    );

    // When
    final apodEntity = mapper.toEntity(apodModel);

    // Then
    expect(apodEntity, isA<ApodEntity>());
    expect(apodEntity.title, 'Test Title');
    expect(apodEntity.explanation, 'Test Explanation');
    expect(apodEntity.hdUrl, 'https://example.com/hd.jpg');
    expect(apodEntity.url, 'https://example.com/image.jpg');
    expect(apodEntity.date, '2025-03-09');
    expect(apodEntity.mediaType, MediaTypeEnum.image);
  });

  test('Given an ApodEntity, '
      'When mapped to ApodModel, '
      'Then it should return a valid ApodModel', () {
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
    final apodModel = mapper.toModel(apodEntity);

    // Then
    expect(apodModel, isA<ApodModel>());
    expect(apodModel.title, 'Test Title');
    expect(apodModel.explanation, 'Test Explanation');
    expect(apodModel.hdUrl, 'https://example.com/hd.jpg');
    expect(apodModel.url, 'https://example.com/image.jpg');
    expect(apodModel.date, '2025-03-09');
    expect(apodModel.mediaType, 'image');
  });
}
