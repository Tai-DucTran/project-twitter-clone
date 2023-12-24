import 'package:finalproject/modules/auth/providers/auth_provider.dart';
import 'package:finalproject/modules/auth/auth_user.dart';
import 'package:finalproject/modules/auth/providers/firebase_auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceController implements AuthProvider {
  final AuthProvider provider;
  const AuthServiceController(this.provider);

  factory AuthServiceController.firebase() => AuthServiceController(
        FirebaseAuthProvider(
          FirebaseAuth.instance,
        ),
      );

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(email: email, password: password);

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
}
