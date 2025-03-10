import 'package:eclipse/src/modules/core/errors.dart';
import 'package:eclipse/src/modules/home/domain/entities/apod_entity.dart';
import 'package:eclipse/src/modules/home/domain/usecases/get_favorites_usecase.dart';
import 'package:eclipse/src/modules/home/domain/usecases/get_media_of_day_usecase.dart';
import 'package:eclipse/src/modules/home/domain/usecases/save_favorites_usecase.dart';
import 'package:eclipse/src/modules/home/presentation/pages/home/home_controller.dart';
import 'package:eclipse/src/modules/home/presentation/pages/home/home_page.dart';
import 'package:eclipse/src/modules/home/presentation/pages/home/home_store.dart';
import 'package:eclipse/src/modules/home/presentation/pages/home/state/favorite_state.dart';
import 'package:eclipse/src/modules/home/presentation/pages/home/state/home_state.dart';
import 'package:eclipse/src/modules/home/presentation/pages/home/widgets/date_widget.dart';
import 'package:eclipse/src/modules/home/presentation/pages/home/widgets/failure_state_widget.dart';
import 'package:eclipse/src/modules/home/presentation/pages/home/widgets/loading_state_widget.dart';
import 'package:eclipse/src/modules/home/presentation/pages/home/widgets/success_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../helpers/font_loader.dart';
import '../../../../../../helpers/make_testable_widget.dart';
import 'home_page_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetFavoritesUsecase>(),
  MockSpec<GetMediaOfDayUsecase>(),
  MockSpec<SaveFavoritesUsecase>(),
])
void main() {
  final mockGetFavoritesUsecase = MockGetFavoritesUsecase();
  final mockGetMediaOfDayUsecase = MockGetMediaOfDayUsecase();
  final mockSaveFavoritesUsecase = MockSaveFavoritesUsecase();
  late HomeStore homeStore;
  late HomeController homeController;

  setUpAll(loadFonts.call);

  setUp(() {
    homeStore = HomeStore();
    homeController = HomeController(
      store: homeStore,
      getFavoritesUsecase: mockGetFavoritesUsecase,
      getMediaOfDayUsecase: mockGetMediaOfDayUsecase,
      saveFavoritesUsecase: mockSaveFavoritesUsecase,
    );
  });

  testWidgets('Given a HomePage, '
      'When the page is loaded, '
      'Then it should display the loagdin state', (WidgetTester tester) async {
    // Given
    when(mockGetFavoritesUsecase()).thenAnswer((_) async => []);

    // When
    await tester.pumpWidget(
      makeTestableWidget(home: HomePage(controller: homeController)),
    );

    // Then
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(DateWidget), findsOneWidget);
    expect(find.byType(LoadingStateWidget), findsOneWidget);
  });

  testWidgets('Given a HomePage, '
      'When the home state is success, '
      'When the home state is success, '
      'Then it should display the success state', (WidgetTester tester) async {
    // Given
    final apodEntity = ApodEntity(
      title: 'Test Title',
      explanation: 'Test Explanation',
      hdUrl: 'https://example.com/hd.jpg',
      url: 'https://example.com/image.jpg',
      date: '2025-03-09',
      mediaType: 'image',
    );
    homeStore.homeState = HomeStateSuccess(apod: apodEntity);
    when(mockGetMediaOfDayUsecase(any)).thenAnswer((_) async => apodEntity);

    // When
    await tester.pumpWidget(
      makeTestableWidget(home: HomePage(controller: homeController)),
    );
    await tester.pump();

    // Then

    expect(find.byType(SuccessStateWidget), findsOneWidget);
  });

  testWidgets('Given a HomePage, '
      'When the home state is failure, '
      'Then it should display the failure state', (WidgetTester tester) async {
    // Given
    final failure = Failure(message: 'Test Failure');

    when(mockGetMediaOfDayUsecase(any)).thenThrow((_) async => failure);

    // When
    await tester.pumpWidget(
      makeTestableWidget(
        home: HomePage(
          controller: homeController,
          selectedDate: DateTime(2025, 3, 9),
        ),
      ),
    );
    await tester.pump();

    // Then
    await expectLater(
      find.byType(HomePage),
      matchesGoldenFile('golden/failure_home_page.png'),
    );
    expect(find.byType(FailureStateWidget), findsOneWidget);
  });

  testWidgets('Given a HomePage, '
      'When the favorite button is pressed, '
      'Then it should call the saveFavorites method', (
    WidgetTester tester,
  ) async {
    // Given
    final apodEntity = ApodEntity(
      title: 'Test Title',
      explanation: 'Test Explanation',
      hdUrl: 'https://example.com/hd.jpg',
      url: 'https://example.com/image.jpg',
      date: '2025-03-09',
      mediaType: 'image',
    );
    homeStore
      ..homeState = HomeStateSuccess(apod: apodEntity)
      ..favoriteState = FavoriteStateSuccess(favorites: []);

    when(mockGetMediaOfDayUsecase(any)).thenAnswer((_) async => apodEntity);
    when(mockGetFavoritesUsecase()).thenAnswer((_) async => [apodEntity]);

    when(
      mockSaveFavoritesUsecase(apod: apodEntity, delete: false),
    ).thenAnswer((_) async => {});

    // When
    await tester.pumpWidget(
      makeTestableWidget(
        home: HomePage(
          controller: homeController,
          selectedDate: DateTime(2025, 3, 9),
        ),
      ),
    );
    await tester.pump();
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    // Then
    await expectLater(
      find.byType(HomePage),
      matchesGoldenFile('golden/favorite_home_page.png'),
    );
    verify(mockSaveFavoritesUsecase(apod: apodEntity, delete: true)).called(1);

    await tester.pump();
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();
    verify(mockSaveFavoritesUsecase(apod: apodEntity, delete: false)).called(1);
  });
}
