import '../../../../../core/errors.dart';
import '../../../../domain/entities/apod_entity.dart';

sealed class FavoriteState {}

final class FavoriteStateInitial extends FavoriteState {}

final class FavoriteStateLoading extends FavoriteState {
  FavoriteStateLoading({required this.date});

  final DateTime date;
}

final class FavoriteStateSave extends FavoriteState {
  FavoriteStateSave({
    required this.apod,
    required this.favorites,
    required this.delete,
  });

  final ApodEntity apod;
  final List<ApodEntity> favorites;
  final bool delete;
}

final class FavoriteStateSuccess extends FavoriteState {
  FavoriteStateSuccess({required this.favorites});

  final List<ApodEntity> favorites;
}

final class FavoriteStateFailure extends FavoriteState {
  FavoriteStateFailure({required this.failure});

  final Failure failure;
}
