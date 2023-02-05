import 'package:finalproject/views/twitter_view.dart';
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
        (tester) async {
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
        (tester) async {
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
          await tester.pumpAndSettle(const Duration(seconds: 1));

          // See the error message:
          final errorText = find.text('Wrong credentials');
          expect(errorText, findsOneWidget);
        },
      );

      testWidgets(
        """
[Login - Login Successfully]
Given I am on the loginPage
And I fill up the loginForm with existed account
Then I can acctually go to twitterPage
And I tap the drawer
Then I tag logOut
Then I confirm to logOut 
""",
        (tester) async {
          // Arrange:
          const email = 'tranductai141@gmail.com';
          const password = '1234abcd';

          // Ensure install and render the app:
          await tester.pumpApp();
          await tester.pumpAndSettle();

          // In the logIn Page:
          expect(find.byType(LoginView), findsOneWidget);

          // Fill the loginForm:
          await _fillLoginForm(
            tester: tester,
            email: email,
            password: password,
          );
          await tester.pump();

          // Submit the loginForm:
          final loginButton = find.text('Login');
          await tester.tap(loginButton);
          await tester.pumpAndSettle(const Duration(seconds: 1));

          // Go to the login Page
          expect(find.byType(Twitter), findsOneWidget);

          // Open the drawer in twitterPage
          final drawerIcon = find.byKey(const Key('twitter-drawer'));
          final ScaffoldState state = tester.firstState(find.byType(Scaffold));
          state.openDrawer();
          await tester.pumpAndSettle(const Duration(milliseconds: 500));

          final logoutButtonInDrawer =
              find.byKey(const Key('logout-button-in-drawer'));
          expect(logoutButtonInDrawer, findsOneWidget);

          // Logout
          await tester.tap(logoutButtonInDrawer, warnIfMissed: false);
          await tester.pumpAndSettle(const Duration(microseconds: 500));

          final dialogLogout = find.byKey(const Key('alert-dialog-drawer'));
          await tester.tap(dialogLogout);
          await tester.pumpAndSettle();
          expect(find.text('Log out'), findsOneWidget);

          final logoutButton = find.text('Log out');
          await tester.tap(logoutButton);
          await tester.pumpAndSettle(const Duration(seconds: 1));
          expect(find.byType(Twitter), findsNothing);
          expect(find.byType(LoginView), findsOneWidget);
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
