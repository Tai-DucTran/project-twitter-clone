import 'package:equatable/equatable.dart';
import 'package:finalproject/views/user_account/login_view.dart';
import 'package:finalproject/views/user_account/register_view.dart';
import 'package:finalproject/views/user_account/verify_email_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'utils/widget_tester_extension.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized().framePolicy =
      LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  late MockFirebaseAuth _mockFirebaseAuth;

  setUp(() async {
    _mockFirebaseAuth = MockFirebaseAuth();
    await Firebase.initializeApp();
  });

  group(
    '[Register]',
    () {
      // writing integration test

      testWidgets("""
[Register - new User]
Given I am on the loginPage
And I tap the registerButton
  Then I move to registerPage
  When I enter a newEmail + anyPassword
  And I tap the regiserButton
Then I move to verifyPage
  And I tap the verifyButton
  And I tapp the loginButton
Then I get back to loginPage
""", (WidgetTester tester) async {
        // Arrange:
        const testUser = User('taitran.deve@gmail.com', '1234abcd');
        when(() => _mockFirebaseAuth.createUser(
                'taitran.deve@gmail.com', '1234abcd'))
            .thenAnswer((invocation) async => testUser);

        await tester.pumpApp();
        await tester.pumpAndSettle();
        expect(find.byType(LoginView), findsOneWidget);
        expect(find.byType(TextField), findsWidgets);
        // Action - move to Register Page:
        final registerPage = find.text('Not registered yet? Register here!');
        await tester.tap(registerPage);
        await tester.pumpAndSettle();

        expect(find.byType(LoginView), findsNothing);
        expect(find.byType(RegisterView), findsOneWidget);

        // Action - fill the Register Form:
        await _fillRegisterForm(
          tester: tester,
          email: 'taitran.deve@gmail.com',
          password: '1234abcd',
        );
        await tester.pump();
        await tester.tap(find.text('Register'));
        await tester.pumpAndSettle(const Duration(milliseconds: 500));

        // // Go to Verify Page:
        expect(find.byType(VerifyEmailView), findsOneWidget);
      });

      testWidgets(
        """
[Register - existed User]
Given I am on the loginPage
And I tap the registerButton
  Then I move to registerPage
  When I enter a newEmail + anyPassword
  And I tap the regiserButton
Then I see an error message
""",
        (WidgetTester tester) async {
          when(() => _mockFirebaseAuth.createUser(
                  'tranductai141@gmail.com', '1234abcd'))
              .thenThrow(EmailAlreadyInUseAuthException);

          await tester.pumpApp();
          await tester.pumpAndSettle();
          expect(find.text('Login here'), findsOneWidget);

          // Get back to login page
          final loginButton = find.text('Login here');
          await tester.tap(loginButton);
          await tester.pumpAndSettle(const Duration(seconds: 1));
          expect(find.byType(RegisterView), findsNothing);
          expect(find.byType(LoginView), findsOneWidget);

          // Action - move to Register Page:
          final registerPage = find.text('Not registered yet? Register here!');
          await tester.tap(registerPage);
          await tester.pumpAndSettle();

          expect(find.byType(LoginView), findsNothing);
          expect(find.byType(RegisterView), findsOneWidget);

          // Action - fill the Register Form:
          await _fillRegisterForm(
            tester: tester,
            email: 'tranductai141@gmail.com',
            password: '1234abcd',
          );
          await tester.pump();
          await tester.tap(find.text('Register'));
          await tester.pumpAndSettle(const Duration(milliseconds: 500));

          // See the error message on the Signup Page
          final errorText = find.text('Email already in use');
          expect(errorText, findsOneWidget);

          // expect(tester.takeException(),
          //     isInstanceOf<EmailAlreadyInUseAuthException>());
          // await tester.pumpAndSettle();
        },
      );
    },
  );
}

Future<void> _fillRegisterForm({
  required WidgetTester tester,
  required String email,
  required String password,
}) async {
  await tester.enterText(
      find.byKey(const Key('register-email-textfield')), email);
  await tester.enterText(
      find.byKey(const Key('register-password-textfield')), password);
}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class EmailAlreadyInUseAuthException implements Exception {}

class FirebaseAuth {
  // Mock FirebaseAuth -> create the newAccount
  Future<User> createUser(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return User(email, password);
  }
  // Mock FirebaseAuth -> current user

}

class User extends Equatable {
  final String email;
  final String password;

  const User(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
