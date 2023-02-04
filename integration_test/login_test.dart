import 'package:finalproject/views/user_account/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import 'utils/widget_tester_extension.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized().framePolicy =
      LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() async {
    mockFirebaseAuth = MockFirebaseAuth();
    await Firebase.initializeApp();
  });

  group(
    '[Login]',
    () {
      testWidgets(
        """
[Login - User not found]
Given I am on the loginPage
And I fill up the form with a non-existed account
Then I see an error message
""",
        (WidgetTester tester) async {
          const email = 'taitran.phim@gmail.com';
          const password = 'anypassword';

          // Ensure install and render the app
          await tester.pumpApp();
          await tester.pumpAndSettle();
          expect(find.byType(LoginView), findsOneWidget);

          // Fill the loginForm + tap the login
          await _fillLoginForm(
            tester: tester,
            email: email,
            password: password,
          );
          await tester.pump();
          final loginButton = find.text('Login');
          await tester.tap(loginButton);
          await tester.pumpAndSettle(const Duration(milliseconds: 500));

          // See the error message:
          final errorText = find.text('User not found');
          expect(errorText, findsOneWidget);
        },
      );

      testWidgets(
        """
[Login - Wrong credentials]
Given I am on the loginPage
And I fill up the form but with a wrong password
Then I see an error message
""",
        (WidgetTester tester) async {
          const email = 'tranductai141@gmail.com';
          const password = 'anypassword';

          // Ensure install and render the app
          await tester.pumpApp();
          await tester.pumpAndSettle();
          expect(find.byType(LoginView), findsOneWidget);

          // Fill the loginForm + tap the login
          await _fillLoginForm(
            tester: tester,
            email: email,
            password: password,
          );
          await tester.pump();
          final loginButton = find.text('Login');
          await tester.tap(loginButton);
          await tester.pumpAndSettle(const Duration(milliseconds: 500));

          // See the error message:
          final errorText = find.text('Wrong credentials');
          expect(errorText, findsOneWidget);
        },
      );
    },
  );
}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// Fill up the form funtion:
Future<void> _fillLoginForm({
  required WidgetTester tester,
  required String email,
  required String password,
}) async {
  await tester.enterText(find.byKey(const Key('login-email-textfield')), email);
  await tester.enterText(
      find.byKey(const Key('login-password-textfield')), password);
}
