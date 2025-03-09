import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'adapters/cache_adapter/cache_adapter.dart';
import 'adapters/cache_adapter/cache_hive/cache_hive.dart';
import 'adapters/http_adapter/dio/dio_adapter.dart';
import 'adapters/http_adapter/dio/interceptor/common_interceptor.dart';
import 'adapters/http_adapter/http_client_adapter.dart';
import 'constants.dart';
import 'usecases/check_internet.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addInstance<Dio>(
        Dio(
          BaseOptions(
            queryParameters: {'api_key': Constants.apiKey},
            baseUrl: 'https://api.nasa.gov/',
          ),
        ),
      )
      ..add<ICacheAdapter>(CacheHive.new)
      ..addInstance<CheckInternetUsecase>(CheckInternetUsecase())
      ..addInstance<List<InterceptorsWrapper>>([
        CommonInterceptor(
          cacheAdapter: i(),
          checkInternetUsecase: i(),
          durationCache: const Duration(minutes: 1),
        ),
      ])
      ..addInstance<IHttpClientAdapter>(
        DioAdapter(dio: i<Dio>(), interceptors: i<List<InterceptorsWrapper>>()),
      );
  }
}
