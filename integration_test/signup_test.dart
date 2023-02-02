import 'package:finalproject/views/user_account/login_view.dart';
import 'package:finalproject/views/user_account/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'utils/widget_tester_extension.dart';

class _MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized().framePolicy =
      LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  late _MockFirebaseAuth _mockFirebaseAuth;

  setUp(() async {
    _mockFirebaseAuth = _MockFirebaseAuth();
    await Firebase.initializeApp();
  });

  group('[Register]', () {

    // writing integration test
    testWidgets(
      """
[Register - invalid email]
Given I am on the loginPage
And I tap the registerButton
Then I move to registerPage
When I enter an invalidEmail + anyPassword
And I tap the registerButton
Then I should see the GenericAuthException notification" 
""",
      (WidgetTester tester) async {
        // Arrange:
        const email = 'invalid';
        const password = '1234abcd';
        
        await tester.pumpApp();
        await tester.pumpAndSettle();
        expect(find.byType(LoginView), findsOneWidget);

        // Action - move to Register Page:
        final registerPage = find.text('Not registered yet? Register here!');
        await tester.tap(registerPage);
        await tester.pumpAndSettle();

        expect(find.byType(LoginView), findsNothing);
        expect(find.byType(RegisterView), findsOneWidget);
        expect(find.text('Create your account'), findsOneWidget);
        // Action - fill the Register Form:

        // Assert:
      },
    );
  });
}
