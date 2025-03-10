import 'package:eclipse/main.dart' as app;
import 'package:eclipse/src/modules/home/presentation/pages/home/widgets/success_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/intl.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Given I started Home Page '
      'When I tap the favorite icon '
      'And I tap the next day button '
      'Then I should see the date of the next day '
      'And I should see an error message '
      '"Ocorreu um erro: Invalid argument(s): A data não pode ser  '
      'futura." '
      'And I should not see the SuccessStateWidget '
      'When I tap the previous day button '
      'Then I should see the date of today '
      'And I should see the SuccessStateWidget '
      'When I tap the previous day button again '
      'Then I should see the date of the previous day '
      'And I should see the SuccessStateWidget', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    await tester.pump();

    await tester.pump();
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();
    await tester.tap(find.byKey(const Key('next_day')));
    await tester.pump();
    final df = DateFormat('dd/MM/yyyy');
    expect(
      find.text(df.format(DateTime.now().add(const Duration(days: 1)))),
      findsWidgets,
    );
    expect(
      find.text(
        'Ocorreu um erro: Invalid argument(s): A data não pode ser futura.',
      ),
      findsOneWidget,
    );
    expect(find.byType(SuccessStateWidget), findsNothing);
    await tester.tap(find.byKey(const Key('previous_day')));

    await tester.pumpAndSettle();
    expect(find.text(df.format(DateTime.now())), findsWidgets);
    expect(find.byType(SuccessStateWidget), findsOneWidget);
    await tester.tap(find.byKey(const Key('previous_day')));
    await tester.pumpAndSettle();

    expect(find.byType(SuccessStateWidget), findsOneWidget);
    expect(
      find.text(df.format(DateTime.now().add(const Duration(days: -1)))),
      findsWidgets,
    );
  });
}
