import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/adapters/cache_adapter/models/cache_model.dart';
import '../repositories/datasource/favorites_datasource.dart';
import '../repositories/models/apod_model.dart';

/// A concrete implementation of [FavoritesDatasource] using Hive as
/// the underlying storage engine.
///
/// This class provides methods to store and retrieve [CacheModel] instances
/// from a Hive database.
class FavoritesDatasourceImpl implements FavoritesDatasource {
  /// Usage:
  /// ```dart
  /// FavoritesDatasourceImpl();
  /// ```
  FavoritesDatasourceImpl() {
    _initDb();
  }

  final completer = Completer<Box>();

  Future _initDb() async {
    final appDocDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocDirectory.path);

    final box = await Hive.openBox('favorites');
    if (!completer.isCompleted) completer.complete(box);
  }

  @override
  Future<void> put(ApodModel data) async {
    final box = await completer.future;
    await box.put(data.date, data.toMap());
  }

  @override
  Future<void> remove(ApodModel data) async {
    final box = await completer.future;
    await box.delete(data.date);
  }

  @override
  Future<Set<ApodModel>> getAll() async {
    try {
      final box = await completer.future;
      final map = box.toMap().map(
        (k, e) => MapEntry(k.toString(), Map<String, dynamic>.from(e)),
      );
      final result =
          map.values
              .map(ApodModel.fromMap)
              .toSet(); // Converta para Set<ApodModel

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
