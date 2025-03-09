import '../../../../../core/errors.dart';
import '../../../../domain/entities/apod_entity.dart';

sealed class HomeState {}

final class HomeStateInitial extends HomeState {}

final class HomeStateLoading extends HomeState {}

final class HomeStateSuccess extends HomeState {
  HomeStateSuccess({required this.apod});

  final ApodEntity apod;
}

final class HomeStateFailure extends HomeState {
  HomeStateFailure({required this.failure});

  final Failure failure;
}
