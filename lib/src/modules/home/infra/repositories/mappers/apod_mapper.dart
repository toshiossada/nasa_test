import '../../../../core/base_mapper.dart';
import '../../../domain/entities/apod_entity.dart';
import '../models/apod_model.dart';

/// A final class that extends [BaseMapper] to provide mapping
/// between [ApodEntity]
/// and [ApodModel].
///
/// This mapper is responsible for converting [ApodModel]
/// instances to [ApodEntity]
/// instances and vice versa, enabling the separation of domain and
/// presentation layers.

final class ApodMapper extends BaseMapper<ApodEntity, ApodModel> {
  @override
  ApodEntity toEntity(ApodModel model) {
    return ApodEntity(
      title: model.title,
      explanation: model.explanation,
      hdUrl: model.hdUrl,
      mediaType: model.mediaType,
      url: model.url,
      date: model.date,
    );
  }

  @override
  ApodModel toModel(ApodEntity entity) {
    return ApodModel(
      title: entity.title,
      explanation: entity.explanation,
      hdUrl: entity.hdUrl,
      mediaType: entity.mediaType.name,
      url: entity.url,
      date: entity.date,
    );
  }
}
