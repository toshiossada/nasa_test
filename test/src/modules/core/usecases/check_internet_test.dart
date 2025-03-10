import 'package:eclipse/src/modules/core/usecases/check_internet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Given a CheckInternetUsecase '
      'When lookup return a empty List '
      'Then should return false', () async {
    final usecase = CheckInternetUsecase.test(
      lookup: () async {
        return [];
      },
    );

    final result = await usecase();

    expect(result, isFalse);
  });

  test('Given a CheckInternetUsecase '
      'When lookup return a items '
      'Then should return true', () async {
    final usecase = CheckInternetUsecase.test(
      lookup: () async {
        return [1];
      },
    );

    final result = await usecase();

    expect(result, isTrue);
  });
}
