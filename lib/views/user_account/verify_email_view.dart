import 'package:finalproject/constants/routes.dart';
import 'package:finalproject/modules/auth/auth_service.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Please Verify Your Email',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 2.2,
                ),
              ),
              const Text(''),
              const Text(
                "We've sent you an email verification. Please open it to verify your account.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(''),
              const Text(
                "If you haven't received a verification email yet, please press the button below",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () async {
                  await AuthServiceController.firebase()
                      .sendEmailVerification();
                },
                child: const Text(
                  'Verify your email',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                },
                child: const Text(
                  'Login here',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
