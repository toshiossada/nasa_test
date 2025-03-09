import 'package:flutter/cupertino.dart';

import 'state/favorite_state.dart';
import 'state/home_state.dart';

class HomeStore {
  final _homeState = ValueNotifier<HomeState>(HomeStateInitial());
  HomeState get homeState => _homeState.value;
  ValueNotifier<HomeState> get homeStream => _homeState;
  set homeState(HomeState state) => _homeState.value = state;

  final _favoriteState = ValueNotifier<FavoriteState>(FavoriteStateInitial());
  FavoriteState get favoriteState => _favoriteState.value;
  ValueNotifier<FavoriteState> get favoriteStream => _favoriteState;
  set favoriteState(FavoriteState state) => _favoriteState.value = state;
}
