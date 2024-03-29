// ignore_for_file: use_build_context_synchronously

import 'package:aries_designs/aries_designs.dart';
import 'package:finalproject/src/constants/routes.dart';
import 'package:finalproject/src/modules/auth/exceptions/auth_exceptions.dart';
import 'package:finalproject/src/modules/auth/controllers/auth_service_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../utilities/show_error_dialog.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: AriesImages.appLogo,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Form(
          child: Column(
            children: [
              const Text(
                "See what's happending in the world right now.",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacing.sp12,
              CustomTextInputField(
                key: const Key('sign-in-email-text-field'),
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter your email here',
              ),
              CustomTextInputField(
                key: const Key('sign-in-password-input-text-field'),
                controller: _password,
                obscureText: true,
                hintText: 'Enter your password here',
              ),
              TextButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  await executingLogin(
                    email: email,
                    password: password,
                    context: context,
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        registerRoute, (route) => false);
                  },
                  child: const Text(
                    'Not registered yet? Register here!',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// TODO(Tai): Resolve issue build context across async gaps

Future<void> executingLogin({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    await AuthServiceController.firebase().logIn(
      email: email,
      password: password,
    );

    final user = AuthServiceController.firebase().currentUser;
    final userName = FirebaseAuth.instance.currentUser?.displayName;

    // user's email is verified
    if (user?.isEmailVerified ?? false) {
      if (userName != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          twitterRoute,
          (route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          createUserNameRoute,
          (route) => false,
        );
      }
    } else {
      // user's email is NOT verified
      Navigator.of(context).pushNamedAndRemoveUntil(
        verifyEmailRoute,
        (route) => false,
      );
    }
  } on UserNotFoundAuthException {
    await showErrorDialog(
      context,
      'User not found',
    );
  } on WrongPasswordAuthException {
    await showErrorDialog(
      context,
      'Wrong credentials',
    );
  } on GenericAuthException {
    await showErrorDialog(
      context,
      'Authentication error',
    );
  }
}
