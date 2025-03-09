import 'package:flutter_modular/flutter_modular.dart';

import '../core/base_mapper.dart';
import '../core/core_module.dart';
import 'domain/entities/apod_entity.dart';
import 'domain/repositories/nasa_repository.dart';
import 'domain/usecases/get_favorites_usecase.dart';
import 'domain/usecases/get_media_od_day_usecase.dart';
import 'domain/usecases/save_favorites_usecase.dart';
import 'infra/datasource/favorites_datasource.dart';
import 'infra/datasource/nasa_datasource.dart';
import 'infra/repositories/datasource/favorites_datasource.dart';
import 'infra/repositories/datasource/nasa_datasource.dart';
import 'infra/repositories/mappers/apod_mapper.dart';
import 'infra/repositories/models/apod_model.dart';
import 'infra/repositories/nasa_repository.dart';
import 'presentation/pages/favorites/favorites_page.dart';
import 'presentation/pages/home/home_controller.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/home/home_store.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];
  @override
  void binds(Injector i) {
    i
      ..add(HomeController.new)
      ..addLazySingleton(HomeStore.new)
      ..add(GetMediaOfDayUsecase.new)
      ..add(GetFavoritesUsecase.new)
      ..add(SaveFavoritesUsecase.new)
      ..add<BaseMapper<ApodEntity, ApodModel>>(ApodMapper.new)
      ..addLazySingleton<FavoritesDatasource>(FavoritesDatasourceImpl.new)
      ..add<NasaRepository>(
        () => NasaRepositoryImpl(
          mapper: i.get<BaseMapper<ApodEntity, ApodModel>>(),
          nasaDatasoure: i.get<NasaDatasource>(),
          favoritesDatasource: i.get<FavoritesDatasource>(),
        ),
      )
      ..add<NasaDatasource>(NasaDatasourceImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(
        '/',
        child: (_) {
          return HomePage(controller: Modular.get());
        },
      )
      ..child(
        '/favorite',
        child: (_) {
          return FavoritesPage(
            favorites: r.args.data['favorites'],
            onFavoritePressed: r.args.data['onFavoritePressed'],
          );
        },
      );
  }
}
