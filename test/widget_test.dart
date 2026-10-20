import 'package:flutter_test/flutter_test.dart';

import 'package:quizapp/data/questions.dart';
import 'package:quizapp/quiz.dart';

void main() {
  testWidgets('Prejde cely kviz az na vysledky', (WidgetTester tester) async {
    await tester.pumpWidget(const Quiz());

    expect(find.text('Start Quiz'), findsOneWidget);
    await tester.tap(find.text('Start Quiz'));
    await tester.pump();

    for (final question in questions) {
      expect(find.text(question.text), findsOneWidget);
      await tester.tap(find.text(question.answers[0]));
      await tester.pump();
    }

    expect(
      find.text(
        'You answered ${questions.length} out of ${questions.length} questions correctly!',
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('Restart Quiz'));
    await tester.pump();
    expect(find.text(questions.first.text), findsOneWidget);
  });
}
