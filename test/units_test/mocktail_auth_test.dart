import 'package:finalproject/services/firebase_auth_service/auth_exceptions.dart';
import 'package:finalproject/services/firebase_auth_service/firebase_auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NotInitializedException implements Exception {}

class _MockFirebaseAuth extends Mock implements FirebaseAuth {}

class User {
  final String email;
  final String password;

  const User(this.email, this.password);
}

void main() {
  late _MockFirebaseAuth mockFirebaseAuth;

  setUp(() async {
    mockFirebaseAuth = _MockFirebaseAuth();
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Mock Authenication', () {
    test(
      "Logout show Exception when the user not login",
      () async {
        // Arrange
        final provider = FirebaseAuthProvider(mockFirebaseAuth);
        when(() => mockFirebaseAuth.currentUser).thenReturn(null);
        // Action:

        // Assert:
        expect(() => provider.logOut(),
            throwsA(isA<UserNotLoggedInAuthException>()));
        verifyNever(() => mockFirebaseAuth.signOut());
      },
    );

    test(
      "Firebase initializeApp",
      () async {
        final provider = FirebaseAuthProvider(mockFirebaseAuth);
        provider.initialize();
      },
    );

    test(
      "create User With Email and Password",
      () async {
        // Arrange
        final provider = FirebaseAuthProvider(mockFirebaseAuth);
        String email = 'test@gmail.com';
        // Action:
        when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'anyEmail',
            password: '123456')).thenThrow(WeakPasswordAuthException);

        when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'foobarbas.com',
            password: 'anyPassword')).thenThrow(InvalidEmailAuthException);

        when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: 'anyEmail')).thenThrow(EmailAlreadyInUseAuthException);

        when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: 'anyEmail')).thenThrow(EmailAlreadyInUseAuthException);
      },
    );
  });
}
