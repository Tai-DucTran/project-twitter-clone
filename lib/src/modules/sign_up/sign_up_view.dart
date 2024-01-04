// ignore_for_file: use_build_context_synchronously

import 'package:aries_designs/aries_designs.dart';
import 'package:finalproject/src/constants/routes.dart';
import 'package:finalproject/src/modules/auth/exceptions/auth_exceptions.dart';
import 'package:finalproject/src/modules/auth/controllers/auth_service_controller.dart';
import 'package:finalproject/src/utilities/show_error_dialog.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                  'Create your account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextInputField(
                  controller: _email,
                  key: const Key('sign-up-email-textfield'),
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Enter your email here',
                ),
                CustomTextInputField(
                  controller: _password,
                  key: const Key('sign-up-password-textfield'),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  hintText: 'Enter your password here',
                ),
                TextButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      await AuthServiceController.firebase().createUser(
                        email: email,
                        password: password,
                      );
                      Navigator.of(context).pushNamed(verifyEmailRoute);
                    } on WeakPasswordAuthException {
                      await showErrorDialog(
                        context,
                        'Weak password',
                      );
                    } on EmailAlreadyInUseAuthException {
                      await showErrorDialog(
                        context,
                        'Email already in use',
                      );
                    } on InvalidEmailAuthException {
                      await showErrorDialog(
                        context,
                        'Invalid Email',
                      );
                    } on GenericAuthException {
                      await showErrorDialog(
                        context,
                        'Fail to register',
                      );
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                  },
                  child: const Text(
                    'Already registered? Login here',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 1.2,
                  child: Text(
                    'By registering, you are to the Terms fo Service and Privacy Policy, including Cookie Use. Twitter may use your contact information, including your email address, and phone number for purpose outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
